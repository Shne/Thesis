#!/usr/bin/python3

import re
import subprocess
import numpy

testDataFileName = 'Output/PrecomputedRankBlockSize_n8as16_build_memory.output'
testsPerSize = 5

gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSize_memory.data", "w")
gnuplotFile.write("#[blockSize] [NaivePrecomputed] [UnalignedNaivePrecomputed] [PreallocatedPrecomputed] [UnalignedPreallocatedPrecomputed] "+
	"[NaiveInteger] [NaivePrecomputedErr] [UnalignedNaivePrecomputedErr] [PreallocatedPrecomputedErr] [UnalignedPreallocatedPrecomputedErr] "+
	"[NaiveIntegerErr]\n")

def avg(list):
	return sum(list)/len(list)

def getTotalMemoryForSpecificTest(dataFile, algorithm, blockSize):
	values = []
	for line in dataFile:
		m = re.search('algorithm='+algorithm+' blockSize='+str(blockSize)+' heap=(?P<heap>\d+) extra=(?P<extra>\d+) stacks=(?P<stacks>\d+)', line)
		if m is not None:
			values.append(int(m.group('heap')) + int(m.group('extra')) + int(m.group('stacks')))
	dataFile.seek(0)
	avgValue = avg(values)
	err = numpy.std(values)
	return (avgValue, err)

pageSize = 4096
quartPage = int(pageSize/4)
blockSizeRange = range(quartPage, pageSize*2 +1, quartPage)

testDataFile = open(testDataFileName, 'r')
NaiveIntegerMem, NaiveIntegerErr = getTotalMemoryForSpecificTest(testDataFile, 'NaiveInteger', 'N/A')

for blockSize in blockSizeRange:
	PreallocatedPrecomputedMem, PreallocatedPrecomputedErr = getTotalMemoryForSpecificTest(testDataFile, 'PreallocatedPrecomputed', blockSize)
	NaivePrecomputedMem, NaivePrecomputedErr = getTotalMemoryForSpecificTest(testDataFile, 'NaivePrecomputed', blockSize)
	UnalignedNaivePrecomputedMem, UnalignedNaivePrecomputedErr = getTotalMemoryForSpecificTest(testDataFile, 'UnalignedNaivePrecomputed', blockSize)
	UnalignedPreallocatedPrecomputedMem, UnalignedPreallocatedPrecomputedErr = getTotalMemoryForSpecificTest(testDataFile, 'UnalignedPreallocatedPrecomputed', blockSize)
	gnuplotFile.write(
		str(blockSize)+" "+
		str(NaivePrecomputedMem)+" "+
		str(UnalignedNaivePrecomputedMem)+" "+
		str(PreallocatedPrecomputedMem)+" "+
		str(UnalignedPreallocatedPrecomputedMem)+" "+
		str(NaiveIntegerMem)+" "+
		str(NaivePrecomputedErr)+" "+
		str(UnalignedNaivePrecomputedErr)+" "+
		str(PreallocatedPrecomputedErr)+" "+
		str(UnalignedPreallocatedPrecomputedErr)+" "+
		str(NaiveIntegerErr)+
		"\n"
	)

gnuplotFile.close()

GnuScriptFileName = '../PrecomputedRankBlockSize_memory_massif.gnu'
cwd = 'Report/Gnuplot/Graphs'
subprocess.Popen(['gnuplot', GnuScriptFileName], cwd=cwd).wait()
