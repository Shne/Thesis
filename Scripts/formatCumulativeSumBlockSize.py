#!/usr/bin/python3

import ReadOutput
import subprocess
import Utils
import numpy
import math

def WriteData(i, testsPerSize):
	startIndex = i*testsPerSize
	endIndex = startIndex + testsPerSize

	BlockSize = avg(ReadOutput.blockSizeList[startIndex:endIndex])
	Walltime = avg(ReadOutput.wallTimeList[startIndex:endIndex])
	WalltimeErr = numpy.std(ReadOutput.wallTimeList[startIndex:endIndex])

	gnuplotFile.write(str(BlockSize) +" "+ str(Walltime) +" "+ str(WalltimeErr) + "\n")

def avg(list):
	if len(list) is 0: return 0
	return sum(list)/len(list)

testDataFile = 'Output/CumulativeSumBlockSize_n8as16_10000Queries.output'
testsPerSize = 5
columns = "[blockSize]  [Walltime]  [WalltimeErr]" + "\n"



gnuplotFile = open("Report/Gnuplot/Data/CumulativeSumBlockSize_Rank.data", "w")
gnuplotFile.write(columns)
ReadOutput.getData(testDataFile, "CumulativeSum", "rank")
for i in range(0, 40):
	WriteData(i, testsPerSize)

ReadOutput.reset()
gnuplotFile.close()



gnuplotFile = open("Report/Gnuplot/Data/CumulativeSumBlockSize_Select.data", "w")
gnuplotFile.write(columns)
ReadOutput.getData(testDataFile, "CumulativeSum", "select")

for i in range(0, 40):
	WriteData(i, testsPerSize)

ReadOutput.reset()
gnuplotFile.close()



gnuplotFile = open("Report/Gnuplot/Data/CumulativeSumBlockSize_SelectBranchless.data", "w")
gnuplotFile.write(columns)
ReadOutput.getData(testDataFile, "CumulativeSum", "selectBranchless")

for i in range(0, 40):
	WriteData(i, testsPerSize)

ReadOutput.reset()
gnuplotFile.close()



gnuplotFile = open("Report/Gnuplot/Data/CumulativeSumBlockSize_Build.data", "w")
gnuplotFile.write(columns)
ReadOutput.getData(testDataFile, "CumulativeSum", "build")

for i in range(0, 40):
	WriteData(i, testsPerSize)

ReadOutput.reset()
gnuplotFile.close()


testDataFile = 'Output/CumulativeSumBlockSizeZoomedRank_n8as16_10000Queries.output'
gnuplotFile = open("Report/Gnuplot/Data/CumulativeSumBlockSize_ZoomedRank.data", "w")
gnuplotFile.write(columns)
ReadOutput.getData(testDataFile, "CumulativeSum", "rank")

for i in range(0, 40):
	WriteData(i, testsPerSize)

ReadOutput.reset()
gnuplotFile.close()


GnuScriptFileName = '../CumulativeSumBlockSize.gnu'
cwd = 'Report/Gnuplot/Graphs'
subprocess.Popen(['gnuplot', GnuScriptFileName], cwd=cwd).wait()
