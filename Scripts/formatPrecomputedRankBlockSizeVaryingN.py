#!/usr/bin/python3

import ReadOutput
import subprocess
import Utils
import numpy


testsPerSize = 5

blockSizeRange = [(2**x)/8 for x in range(6, 18+1)]

def avg(list):
	if len(list) is 0: return 0
	return sum(list)/len(list)

def writeGnuplotHeader(gnuplotFile):
	gnuplotFile.write("#[alphabetSize] [Amount] [Walltime] [BlockSize] [WalltimeErr]\n")

def formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize):
	dataListKeys = ["alphabetSizeList", "wallTimeList", "blockSizeList"]
	gnuplotFile.write(Utils.getMaxRelativeStddevStr(ReadOutput, dataListKeys, testsPerSize) + "\n")
	gnuplotFile.write(Utils.getAvgRelativeStddevStr(ReadOutput, dataListKeys, testsPerSize) + "\n")

	for i in range(int(len(ReadOutput.amountList)/testsPerSize)):
		startIndex = i*testsPerSize
		endIndex = startIndex + testsPerSize

		alphabetSize = avg(ReadOutput.alphabetSizeList[startIndex:endIndex])
		amount = avg(ReadOutput.amountList[startIndex:endIndex])
		blockSize = avg(ReadOutput.blockSizeList[startIndex:endIndex])
		Walltime = avg(ReadOutput.wallTimeList[startIndex:endIndex])

		WalltimeErr = numpy.std(ReadOutput.wallTimeList[startIndex:endIndex])

		gnuplotFile.write(str(alphabetSize)+" "+
			str(amount)+" "+
			str(Walltime)+" "+
			str(blockSize)+" "+
			str(WalltimeErr)+" "+
			"\n"
		)

def doStuff(amount):
	testDataFile = 'Output/PrecomputedRankBlockSizeVaryN_n'+str(amount)+'as16.output'
	gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSizeVaryN_"+str(amount)+"_Rank.data", "w")
	writeGnuplotHeader(gnuplotFile)
	ReadOutput.getData(testDataFile, "UnalignedNaivePrecomputed", "rank")
	formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize)
	gnuplotFile.close()

doStuff(5)
doStuff(6)
doStuff(7)
doStuff(8)



GnuScriptFileName = '../PrecomputedRankBlockSizeVaryN.gnu'
cwd = 'Report/Gnuplot/Graphs'
subprocess.Popen(['gnuplot', GnuScriptFileName], cwd=cwd).wait()
