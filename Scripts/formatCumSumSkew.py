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
	gnuplotFile.write("#[Skew] [Walltime] [WalltimeErr] [L1CM] [L1CMErr] [L2CM] [L2CMErr] [L3CM] [L3CMErr] [BM] [BMErr] [BMExe] [BMExeErr] [BMRate] [BMRateErr] [TLBM] [TLBMErr] [L2CH] [L2CHErr] [L2CHRate] [L2CHRateErr]\n")

def formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize):
	dataListKeys = ["wallTimeList", "skewList"]
	gnuplotFile.write(Utils.getMaxRelativeStddevStr(ReadOutput, dataListKeys, testsPerSize) + "\n")
	gnuplotFile.write(Utils.getAvgRelativeStddevStr(ReadOutput, dataListKeys, testsPerSize) + "\n")

	for i in range(int(len(ReadOutput.wallTimeList)/testsPerSize)):
		startIndex = i*testsPerSize
		endIndex = startIndex + testsPerSize

		skew = avg(ReadOutput.skewList[startIndex:endIndex])
		Walltime = avg(ReadOutput.wallTimeList[startIndex:endIndex])
		WalltimeErr = numpy.std(ReadOutput.wallTimeList[startIndex:endIndex])
		L1CM = avg(ReadOutput.l1DataCacheMissesList[startIndex:endIndex])
		L1CMErr = numpy.std(ReadOutput.l1DataCacheMissesList[startIndex:endIndex])
		L2CM = avg(ReadOutput.l2DataCacheMissesList[startIndex:endIndex])
		L2CMErr = numpy.std(ReadOutput.l2DataCacheMissesList[startIndex:endIndex])
		L3CM = avg(ReadOutput.l3TotalCacheMissesList[startIndex:endIndex])
		L3CMErr = numpy.std(ReadOutput.l3TotalCacheMissesList[startIndex:endIndex])
		BM = avg(ReadOutput.branchMispredictionsList[startIndex:endIndex])
		BMErr = numpy.std(ReadOutput.branchMispredictionsList[startIndex:endIndex])
		BMExe = avg(ReadOutput.branchExecutedList[startIndex:endIndex])
		BMExeErr = numpy.std(ReadOutput.branchExecutedList[startIndex:endIndex])
		BMRate = numpy.average(ReadOutput.branchMissRateList[startIndex:endIndex])
		BMRateErr = numpy.std(ReadOutput.branchMissRateList[startIndex:endIndex])
		TLBM = avg(ReadOutput.TLBList[startIndex:endIndex])
		TLBMErr = numpy.std(ReadOutput.TLBList[startIndex:endIndex])
		L2CH = avg(ReadOutput.l2DataCacheHitsList[startIndex:endIndex])
		L2CHErr = numpy.std(ReadOutput.l2DataCacheHitsList[startIndex:endIndex])
		L2CHRate = L2CH/(L2CM+L2CH)
		L2CHRateErr = numpy.sqrt( pow((L2CMErr/L2CM),2) + pow((L2CHErr/L2CH),2) )


		gnuplotFile.write(str(skew)+" "+
			str(Walltime)+" "+
			str(WalltimeErr)+" "+
			str(L1CM)+" "+
			str(L1CMErr)+" "+
			str(L2CM)+" "+
			str(L2CMErr)+" "+
			str(L3CM)+" "+
			str(L3CMErr)+" "+
			str(BM)+" "+
			str(BMErr)+" "+
			str(BMExe)+" "+
			str(BMExeErr)+" "+
			str(BMRate)+" "+
			str(BMRateErr)+" "+
			str(TLBM)+" "+
			str(TLBMErr)+" "+
			str(L2CH)+" "+
			str(L2CHErr)+" "+
			str(L2CHRate)+" "+
			str(L2CHRateErr)+" "+

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
