#!/usr/bin/python3

import ReadOutput
import subprocess
import Utils

testDataFile = 'Output/PrecomputedRankBlockSize_n8as16_build.output'
testsPerSize = 1

pageSize = 4096
quartPage = int(pageSize/4)
blockSizeRange = range(quartPage, pageSize*2 +1, quartPage)

def PadNaiveInteger(ReadOutput):
	MemSize = ReadOutput.memSizeList[:]
	# MemResident = ReadOutput.memResidentList[:]
	# MemHighWatermark = ReadOutput.memHighWatermarkList[:]
	ReadOutput.reset()
	for blockSize in blockSizeRange:
		for i in range(testsPerSize):
			ReadOutput.blockSizeList.append(blockSize*8)
			ReadOutput.memSizeList.append(MemSize[i])
			# ReadOutput.memResidentList.append(MemResident[i])
			# ReadOutput.memHighWatermarkList.append(MemHighWatermark[i])

# NAIVEINTEGER
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSize_NaiveInteger_Build.data", "w")
Utils.writeMemGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "SimpleNaiveInteger", "build")
PadNaiveInteger(ReadOutput)
Utils.formatAndWriteMemValues(ReadOutput, gnuplotFile, testsPerSize)

#PREALLOCATED PRECOMPUTED
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Build.data", "w")
Utils.writeMemGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "PreallocatedPrecomputed", "build")
Utils.formatAndWriteMemValues(ReadOutput, gnuplotFile, testsPerSize)


#NAIVE PRECOMPUTED
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSize_NaivePrecomputed_Build.data", "w")
Utils.writeMemGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "NaivePrecomputed", "build")
Utils.formatAndWriteMemValues(ReadOutput, gnuplotFile, testsPerSize)


#UNALIGNED NAIVE PRECOMPUTED
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Build.data", "w")
Utils.writeMemGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "UnalignedNaivePrecomputed", "build")
Utils.formatAndWriteMemValues(ReadOutput, gnuplotFile, testsPerSize)


gnuplotFile.close()

GnuScriptFileName = '../PrecomputedRankBlockSize_memory.gnu'
cwd = 'Report/Gnuplot/Graphs'
subprocess.Popen(['gnuplot', GnuScriptFileName], cwd=cwd).wait()
