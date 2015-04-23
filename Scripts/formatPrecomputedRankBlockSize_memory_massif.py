#!/usr/bin/python3

import re
import subprocess

testDataFileName = 'Output/PrecomputedRankBlockSize_n8as16_build_memory.output'
testsPerSize = 5

gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSize_memory.data", "w")
gnuplotFile.write("#[blockSize] [NaivePrecomputed] [UnalignedNaivePrecomputed] [PreallocatedPrecomputed] [UnalignedPreallocatedPrecomputed] [NaiveInteger]\n")


def getTotalMemoryForSpecificTest(dataFile, algorithm, blockSize):
	for line in dataFile:
		m = re.search('algorithm='+algorithm+' blockSize='+str(blockSize)+' heap=(?P<heap>\d+) extra=(?P<extra>\d+) stacks=(?P<stacks>\d+)', line)
		if m is not None:
			dataFile.seek(0)
			return int(m.group('heap')) + int(m.group('extra')) + int(m.group('stacks'))

pageSize = 4096
quartPage = int(pageSize/4)
blockSizeRange = range(quartPage, pageSize*2 +1, quartPage)

testDataFile = open(testDataFileName, 'r')
naiveIntegerMem = getTotalMemoryForSpecificTest(testDataFile, 'NaiveInteger', 'N/A')

for blockSize in blockSizeRange:
	PreallocatedPrecomputedMem = getTotalMemoryForSpecificTest(testDataFile, 'PreallocatedPrecomputed', blockSize)
	NaivePrecomputedMem = getTotalMemoryForSpecificTest(testDataFile, 'NaivePrecomputed', blockSize)
	UnalignedNaivePrecomputedMem = getTotalMemoryForSpecificTest(testDataFile, 'UnalignedNaivePrecomputed', blockSize)
	UnalignedPreallocatedPrecomputedMem = getTotalMemoryForSpecificTest(testDataFile, 'UnalignedPreallocatedPrecomputed', blockSize)
	gnuplotFile.write(str(blockSize)+" "+str(NaivePrecomputedMem)+" "+str(UnalignedNaivePrecomputedMem)+" "+str(PreallocatedPrecomputedMem)+" "+str(UnalignedPreallocatedPrecomputedMem)+" "+str(naiveIntegerMem)+"\n")

gnuplotFile.close()

GnuScriptFileName = '../PrecomputedRankBlockSize_memory_massif.gnu'
cwd = 'Report/Gnuplot/Graphs'
subprocess.Popen(['gnuplot', GnuScriptFileName], cwd=cwd).wait()
