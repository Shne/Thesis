#!/usr/bin/python3

import re
import subprocess
import numpy

testDataFileName = 'Output/CumulativeSumVsUnalignedNaive_build_blocksize_memory.output'
testsPerSize = 5



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

blockSizeRange = [2**i for i in range(3, 17)]

testDataFile = open(testDataFileName, 'r')

#UnalignedNaivePrecomputed
gnuplotFile = open("Report/Gnuplot/Data/UnalignedNaive_build_blocksize_memory.data", "w")
gnuplotFile.write("#[blockSize]  [Memory]  [MemoryErr]\n")

for blockSize in blockSizeRange:
	UnalignedNaivePrecomputedMem, UnalignedNaivePrecomputedErr = getTotalMemoryForSpecificTest(testDataFile, 'UnalignedNaivePrecomputed', blockSize)
	gnuplotFile.write(
		str(blockSize)+" "+
		str(UnalignedNaivePrecomputedMem)+" "+
		str(UnalignedNaivePrecomputedErr)+
		"\n"
	)

gnuplotFile.close()


#CumulativeSum
gnuplotFile = open("Report/Gnuplot/Data/CumulativeSum_build_blocksize_memory.data", "w")
gnuplotFile.write("#[blockSize]  [Memory]  [MemoryErr]\n")

for blockSize in blockSizeRange:
	CumulativeSumMem, CumulativeSumErr = getTotalMemoryForSpecificTest(testDataFile, 'CumulativeSum', blockSize)
	gnuplotFile.write(
		str(blockSize)+" "+
		str(CumulativeSumMem)+" "+
		str(CumulativeSumErr)+
		"\n"
	)

gnuplotFile.close()

GnuScriptFileName = '../CumulativeSumVsUnalignedNaiveBlockSizeBuildMemory.gnu'
cwd = 'Report/Gnuplot/Graphs'
subprocess.Popen(['gnuplot', GnuScriptFileName], cwd=cwd).wait()
