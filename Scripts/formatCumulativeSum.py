#!/usr/bin/python3

import numpy
import ReadOutput
import subprocess

GnuplotFile = open("Report/Gnuplot/Data/CumulativeSum.data", "w")
testDataFile = 'Output/CumulativeSum_n8as16.output'

def avg(list):
	return sum(list) / len(list)

def formatAndPrintValues(ReadOutput):
	MCycles = avg(ReadOutput.totalCyclesList)
	MWalltime = avg(ReadOutput.wallTimeList)
	MBranchMis = avg(ReadOutput.branchMispredictionsList)
	MTLB = avg(ReadOutput.TLBList)
	M1CM = avg(ReadOutput.l1DataCacheMissesList)
	M2CM = avg(ReadOutput.l2DataCacheMissesList)
	M2CHits = avg(ReadOutput.l2DataCacheHitsList)
	M2CMRate = M2CM/M2CHits
	M3CM = avg(ReadOutput.l3TotalCacheMissesList)

	# Gnuplotfile
	GnuplotFile.write(
		'\t'+str(MCycles)+
		'\t'+str(MWalltime)+
		'\t'+str(MBranchMis)+
		'\t'+str(MTLB)+
		'\t'+str(M1CM)+
		'\t'+str(M2CM)+
		'\t'+str(M2CHits)+
		'\t'+str(M2CMRate)+
		'\t'+str(M3CM)+
		'\n'
	)

	# ALSO OUTPUT ERROR


### UNALIGNEDNAIVE ###
# BUILD
ReadOutput.getData(testDataFile, "UnalignedNaivePrecomputed", "build")
formatAndPrintValues(ReadOutput)

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


GnuScriptFileName = '../CumulativeSum.gnu'
cwd = 'Report/Gnuplot/Graphs'
subprocess.Popen(['gnuplot', GnuScriptFileName], cwd=cwd).wait()
