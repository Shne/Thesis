#!/usr/bin/python3

import numpy
import math

def median(list):
	return int(numpy.median(numpy.array(list)))

def avg(list):
	if len(list) is 0: return 0
	return sum(list)/len(list)

def getRelativeStddev(stepsize, inputList):
	relativeStddevList = []
	for i in range(0, len(inputList), stepsize):
		temp = []
		for j in range(i, stepsize+i):
			temp.append(inputList[j])		
		variance = numpy.var(temp)
		mean = numpy.average(numpy.array(temp))
		stddev = math.sqrt(variance)
		relativeStddev = stddev/mean
		relativeStddevList.append(relativeStddev)

	return relativeStddevList

def getMaxRelativeStddevStr(ReadOutput, columnNames, stepsize):
	dataTable = ReadOutput.getReadOutputLists(columnNames)
	alphabetValues = dataTable[0]
	dataTable.remove(alphabetValues)
	
	maxRelativeStddev = "0"
	for dataRow in dataTable:
		relativeStddev = getRelativeStddev(stepsize, dataRow)
		if len(dataRow) == 0:
			formattedResult = "0.000"
		else:
			formattedResult = "{0:.3f}".format(max(relativeStddev)*100)
		maxRelativeStddev += "   " + formattedResult
	
	return maxRelativeStddev

def getAvgRelativeStddevStr(ReadOutput, columnNames, stepsize):

	dataTable = ReadOutput.getReadOutputLists(columnNames)
	alphabetValues = dataTable[0]
	dataTable.remove(alphabetValues)

	avgRelativeStddev = "0"
	for dataRow in dataTable:
		relativeStddev = getRelativeStddev(stepsize, dataRow)
		if len(dataRow) == 0:
			formattedResult = "0.00"
		else:
			formattedResult = "{0:.2f}".format(numpy.average(relativeStddev)*100)
		
		avgRelativeStddev += "   " + formattedResult
	
	return avgRelativeStddev

def writeGnuplotHeader(gnuplotFile):
	gnuplotFile.write("#[alphabetSize] [Walltime] [BlockSize] [BranchMissRate] [BranchMis] [TLB] [L1CM] [L2CM] [L3CM]" +"\n")

def formatAndWriteValues(ReadOutput, gnuplotFile, dataListKeys, testsPerSize):

	gnuplotFile.write(getMaxRelativeStddevStr(ReadOutput, dataListKeys, testsPerSize) + "\n")
	gnuplotFile.write(getAvgRelativeStddevStr(ReadOutput, dataListKeys, testsPerSize) + "\n")
	for i in range(int(len(ReadOutput.alphabetSizeList)/testsPerSize)):
		startIndex = i*testsPerSize
		endIndex = startIndex + testsPerSize

		alphabetSize = avg(ReadOutput.alphabetSizeList[startIndex:endIndex])
		blockSize = avg(ReadOutput.blockSizeList[startIndex:endIndex])
		Cycles = avg(ReadOutput.totalCyclesList[startIndex:endIndex])
		Walltime = avg(ReadOutput.wallTimeList[startIndex:endIndex])
		BranchMis = avg(ReadOutput.branchMispredictionsList[startIndex:endIndex])
		BranchExe = avg(ReadOutput.branchExecutedList[startIndex:endIndex])
		BranchMissRate = numpy.average(ReadOutput.branchMissRateList[startIndex:endIndex])
		TLB = avg(ReadOutput.TLBList[startIndex:endIndex])
		L1CM = avg(ReadOutput.l1DataCacheMissesList[startIndex:endIndex])
		L2CM = avg(ReadOutput.l2DataCacheMissesList[startIndex:endIndex])
		L3CM = avg(ReadOutput.l3TotalCacheMissesList[startIndex:endIndex])

		gnuplotFile.write(str(alphabetSize) +" "+ str(Walltime) +" "+ str(blockSize) +" "+ str(BranchMissRate) +" "+ str(BranchMis) +" "+ str(TLB) +" "+ str(L1CM) +" "+ str(L2CM) +" "+ str(L3CM) +"\n")