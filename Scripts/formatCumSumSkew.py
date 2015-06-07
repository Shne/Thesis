#!/usr/bin/python3

import ReadOutput
import subprocess
import Utils
import numpy


testDataFile = 'Output/CumulativeSumSkew_n8as16.output'
testsPerSize = 5


def avg(list):
	if len(list) is 0: return 0
	return sum(list)/len(list)

def writeGnuplotHeader(gnuplotFile):
	gnuplotFile.write("#[Skew] [Walltime] [WalltimeErr]\n")

def formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize):
	dataListKeys = ["wallTimeList", "skewList"]
	gnuplotFile.write(Utils.getMaxRelativeStddevStr(ReadOutput, dataListKeys, testsPerSize) + "\n")
	gnuplotFile.write(Utils.getAvgRelativeStddevStr(ReadOutput, dataListKeys, testsPerSize) + "\n")

	for i in range(int(len(ReadOutput.amountList)/testsPerSize)):
		startIndex = i*testsPerSize
		endIndex = startIndex + testsPerSize

		skew = avg(ReadOutput.skewList[startIndex:endIndex])
		Walltime = avg(ReadOutput.wallTimeList[startIndex:endIndex])
		WalltimeErr = numpy.std(ReadOutput.wallTimeList[startIndex:endIndex])

		gnuplotFile.write(str(skew)+" "+
			str(Walltime)+" "+
			str(WalltimeErr)+" "+
			"\n"
		)

gnuplotFile = open("Report/Gnuplot/Data/CumulativeSumSkew_n8as16_Build.data", "w")
writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "CumulativeSum", "build")
formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize)

gnuplotFile = open("Report/Gnuplot/Data/CumulativeSumSkew_n8as16_Rank.data", "w")
writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "CumulativeSum", "rank")
formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize)

gnuplotFile = open("Report/Gnuplot/Data/CumulativeSumSkew_n8as16_Select.data", "w")
writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "CumulativeSum", "select")
formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize)


gnuplotFile.close()

GnuScriptFileName = '../CumulativeSumSkew_n8as16.gnu'
cwd = 'Report/Gnuplot/Graphs'
subprocess.Popen(['gnuplot', GnuScriptFileName], cwd=cwd).wait()
