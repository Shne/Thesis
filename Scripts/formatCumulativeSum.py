#!/usr/bin/python3

import numpy
import ReadOutput
import subprocess
import re

GnuplotFile = open("Report/Gnuplot/Data/CumulativeSum.data", "w")
memGnuplotFile = open("Report/Gnuplot/Data/CumulativeSum_memory_massif.data", "w")
testDataFile = 'Output/CumulativeSum_n8as16.output'
memTestDataFile = 'Output/CumulativeSum_n8as16_build_memory.output'

def avg(list):
	return sum(list) / len(list)

def printHeader():
	GnuplotFile.write(
		    '#[MemSize]'+
		'\t'+'[MemResident]'+
		'\t'+'[MemHighWatermark]'+
		'\t'+'[MemSizeErr]'+
		'\t'+'[MemResidentErr]'+
		'\t'+'[MemHighWatermarkErr]'+
		'\n'
	)

def printMemHeader():
	GnuplotFile.write(
		    '#[Cycles]'+
		'\t'+'[Walltime]'+
		'\t'+'[BranchMis]'+
		'\t'+'[BranchExe]'+
		'\t'+'[BranchMissRate]'+
		'\t'+'[TLB]'+
		'\t'+'[1CM]'+
		'\t'+'[2CM]'+
		'\t'+'[2CHits]'+
		'\t'+'[2CMRate]'+
		'\t'+'[3CM]'+
		'\t'+'[CyclesErr]'+
		'\t'+'[WalltimeErr]'+
		'\t'+'[BranchMisErr]'+
		'\t'+'[BranchExeErr]'+
		'\t'+'[BranchMissRateErr]'+
		'\t'+'[TLBErr]'+
		'\t'+'[1CMErr]'+
		'\t'+'[2CMErr]'+
		'\t'+'[2CHitsErr]'+
		'\t'+'[2CMRateErr]'+
		'\t'+'[3CMErr]'+
		'\n'
	)

def formatAndPrintValues(ReadOutput):
	# MEASUREMENTS
	MCycles = avg(ReadOutput.totalCyclesList)
	MWalltime = avg(ReadOutput.wallTimeList)
	MBranchMis = avg(ReadOutput.branchMispredictionsList)
	MBranchExe = avg(ReadOutput.branchExecutedList)
	MBranchMissRate = numpy.average(ReadOutput.branchMissRateList)
	MTLB = avg(ReadOutput.TLBList)
	M1CM = avg(ReadOutput.l1DataCacheMissesList)
	M2CM = avg(ReadOutput.l2DataCacheMissesList)
	M2CHits = avg(ReadOutput.l2DataCacheHitsList)
	M2CMRate = M2CM/M2CHits
	M3CM = avg(ReadOutput.l3TotalCacheMissesList)

	# Gnuplotfile
	GnuplotFile.write(str(MCycles)+
		'\t'+str(MWalltime)+
		'\t'+str(MBranchMis)+
		'\t'+str(MBranchExe)+
		'\t'+str(MBranchMissRate)+
		'\t'+str(MTLB)+
		'\t'+str(M1CM)+
		'\t'+str(M2CM)+
		'\t'+str(M2CHits)+
		'\t'+str(M2CMRate)+
		'\t'+str(M3CM)
	)

	# ERROR
	ECycles = numpy.std(ReadOutput.totalCyclesList)
	EWalltime = numpy.std(ReadOutput.wallTimeList)
	EBranchMis = numpy.std(ReadOutput.branchMispredictionsList)
	EBranchExe = numpy.std(ReadOutput.branchExecutedList)
	EBranchMissRate = numpy.std(ReadOutput.branchMissRateList)
	ETLB = numpy.std(ReadOutput.TLBList)
	E1CM = numpy.std(ReadOutput.l1DataCacheMissesList)
	E2CM = numpy.std(ReadOutput.l2DataCacheMissesList)
	E2CHits = numpy.std(ReadOutput.l2DataCacheHitsList)
	E2CMRate = numpy.sqrt( pow((E2CM/M2CM),2) + pow((E2CHits/M2CHits),2) )
	E3CM = numpy.std(ReadOutput.l3TotalCacheMissesList)

	GnuplotFile.write(
		'\t'+str(ECycles)+
		'\t'+str(EWalltime)+
		'\t'+str(EBranchMis)+
		'\t'+str(EBranchExe)+
		'\t'+str(EBranchMissRate)+
		'\t'+str(ETLB)+
		'\t'+str(E1CM)+
		'\t'+str(E2CM)+
		'\t'+str(E2CHits)+
		'\t'+str(E2CMRate)+
		'\t'+str(E3CM)+
		'\n'
	)

def getTotalMemoryForSpecificTest(testDataFileName, algorithm, blockSize):
	values = []
	dataFile = open(testDataFileName, 'r')
	for line in dataFile:
		m = re.search('algorithm='+algorithm+' blockSize='+str(blockSize)+' heap=(?P<heap>\d+) extra=(?P<extra>\d+) stacks=(?P<stacks>\d+)', line)
		if m is not None:
			values.append(int(m.group('heap')) + int(m.group('extra')) + int(m.group('stacks')))
	dataFile.seek(0)
	avgValue = avg(values)
	err = numpy.std(values)
	return (avgValue, err)


def formatAndPrintMemValues():
	memGnuplotFile.write('#[UnalignedNaiveMem] [CumulativeSumMem] [UnalignedNaiveErr] [CumulativeSumErr]\n')
	blockSize = 2048
	UnalignedNaiveMem, UnalignedNaiveErr = getTotalMemoryForSpecificTest(memTestDataFile, 'UnalignedNaive', blockSize)
	CumulativeSumMem, CumulativeSumErr = getTotalMemoryForSpecificTest(memTestDataFile, 'CumulativeSum', blockSize)
	memGnuplotFile.write(
		str(UnalignedNaiveMem)+" "+
		str(UnalignedNaiveErr)+"\n"+
		str(CumulativeSumMem)+" "+
		str(CumulativeSumErr)+" "+
		"\n"
	)


printHeader()

### UNALIGNEDNAIVE ###
# BUILD
ReadOutput.getData(testDataFile, "UnalignedNaivePrecomputed", "build")
formatAndPrintValues(ReadOutput)

# Build Memory
formatAndPrintMemValues()

# RANK
ReadOutput.getData(testDataFile, "UnalignedNaivePrecomputed", "rank")
formatAndPrintValues(ReadOutput)

# SELECT
ReadOutput.getData(testDataFile, "UnalignedNaivePrecomputed", "select")
formatAndPrintValues(ReadOutput)

### CUMULATIVESUM ###
# BUILD
ReadOutput.getData(testDataFile, "CumulativeSum", "build")
formatAndPrintValues(ReadOutput)

# RANK
ReadOutput.getData(testDataFile, "CumulativeSum", "rank")
formatAndPrintValues(ReadOutput)

# SELECT
ReadOutput.getData(testDataFile, "CumulativeSum", "select")
formatAndPrintValues(ReadOutput)

# SELECT BRANCHLESS
ReadOutput.getData(testDataFile, "CumulativeSum", "selectBranchless")
formatAndPrintValues(ReadOutput)


GnuplotFile.close()
memGnuplotFile.close()


GnuScriptFileName = '../CumulativeSum.gnu'
cwd = 'Report/Gnuplot/Graphs'
subprocess.Popen(['gnuplot', GnuScriptFileName], cwd=cwd).wait()
