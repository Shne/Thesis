#!/usr/bin/python3

import numpy
import ReadOutput
import subprocess
import math

def median(list):
	return int(numpy.median(numpy.array(list)))

def avg(list):
	return sum(list)/len(list)


def getNumberOfEqualAlphabetValues(alphabetList):
	amount = 0
	for alphabet in alphabetList:
		if(alphabet == alphabetList[0]):			
			amount += 1

		if(alphabet > alphabetList[0]):
			break
	return amount


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


def getMaxRelativeStddevStr(columnNames):
	dataTable = ReadOutput.getReadOutputLists(columnNames)
	alphabetValues = dataTable[0]
	dataTable.remove(alphabetValues)
	stepsize = getNumberOfEqualAlphabetValues(alphabetValues)

	maxRelativeStddev = "0"
	for dataRow in dataTable:
		relativeStddev = getRelativeStddev(stepsize, dataRow)
		maxRelativeStddev += "   " + "{0:.3f}".format(max(relativeStddev)*100)
	
	return maxRelativeStddev

def getAvgRelativeStddevStr(columnNames):
	dataTable = ReadOutput.getReadOutputLists(columnNames)
	alphabetValues = dataTable[0]
	dataTable.remove(alphabetValues)
	stepsize = getNumberOfEqualAlphabetValues(alphabetValues)	

	avgRelativeStddev = "0"
	for dataRow in dataTable:
		relativeStddev = getRelativeStddev(stepsize, dataRow)
		avgRelativeStddev += "   " + "{0:.2f}".format(numpy.average(relativeStddev)*100)
	
	return avgRelativeStddev


GnuplotFile = open("Report/Gnuplot/Data/NaiveIntegerAlphabetsize.data", "w")
testDataFile = 'Output/naiveIntegerAlphabetSize.output'
testsPerSize = 5

ReadOutput.getData(testDataFile, "SimpleNaiveInteger", "build")

dataListKeys = ["alphabetSizeList", "wallTimeList", "branchMissRateList", "branchMispredictionsList", "TLBList", "l1DataCacheMissesList", "l2DataCacheMissesList", "l3TotalCacheMissesList"]

#LARGE N
GnuplotFile.write("#[alphabetSize]" +" "+ "[Walltime]" +" "+ "[BranchMissRate]" +" "+ "[BranchMis]" +" "+ "[TLB]" +" "+ "[L1CM]" +" "+ "[L2CM]" +" "+ "[L3CM]" +"\n")
GnuplotFile.write(getMaxRelativeStddevStr(dataListKeys) + "\n")
GnuplotFile.write(getAvgRelativeStddevStr(dataListKeys) + "\n")
for i in range(int(len(ReadOutput.alphabetSizeList)/testsPerSize)):
	startIndex = i*testsPerSize
	endIndex = startIndex + testsPerSize

	alphabetSize = avg(ReadOutput.alphabetSizeList[startIndex:endIndex])
	Cycles = avg(ReadOutput.totalCyclesList[startIndex:endIndex])
	Walltime = avg(ReadOutput.wallTimeList[startIndex:endIndex])
	BranchMis = avg(ReadOutput.branchMispredictionsList[startIndex:endIndex])
	BranchExe = avg(ReadOutput.branchExecutedList[startIndex:endIndex])
	BranchMissRate = numpy.average(ReadOutput.branchMissRateList[startIndex:endIndex])
	TLB = avg(ReadOutput.TLBList[startIndex:endIndex])
	L1CM = avg(ReadOutput.l1DataCacheMissesList[startIndex:endIndex])
	L2CM = avg(ReadOutput.l2DataCacheMissesList[startIndex:endIndex])
	L3CM = avg(ReadOutput.l3TotalCacheMissesList[startIndex:endIndex])

	GnuplotFile.write(str(alphabetSize) +" "+ str(Walltime) +" "+ str(BranchMissRate) +" "+ str(BranchMis) +" "+ str(TLB) +" "+ str(L1CM) +" "+ str(L2CM) +" "+ str(L3CM) +"\n")

GnuplotFile.close()

# SMALL N
GnuplotFile = open("Report/Gnuplot/Data/naiveIntegerAlphabetSize_smallN.data", "w")
testDataFile = 'Output/naiveIntegerAlphabetSize_smallN.output'
testsPerSize = 5

ReadOutput.getData(testDataFile, "SimpleNaiveInteger", "build")
GnuplotFile.write("#[alphabetSize]" +" "+ "[Walltime]" +" "+ "[BranchMissRate]" +" "+ "[BranchMis]" +" "+ "[TLB]" +" "+ "[L1CM]" +" "+ "[L2CM]" +" "+ "[L3CM]" +"\n")
GnuplotFile.write(getMaxRelativeStddevStr(dataListKeys) + "\n")
GnuplotFile.write(getAvgRelativeStddevStr(dataListKeys) + "\n")
for i in range(int(len(ReadOutput.alphabetSizeList)/testsPerSize)):
	startIndex = i*testsPerSize
	endIndex = startIndex + testsPerSize

	alphabetSize = avg(ReadOutput.alphabetSizeList[startIndex:endIndex])
	Cycles = avg(ReadOutput.totalCyclesList[startIndex:endIndex])
	Walltime = avg(ReadOutput.wallTimeList[startIndex:endIndex])
	BranchMis = avg(ReadOutput.branchMispredictionsList[startIndex:endIndex])
	BranchExe = avg(ReadOutput.branchExecutedList[startIndex:endIndex])
	BranchMissRate = numpy.average(ReadOutput.branchMissRateList[startIndex:endIndex])
	TLB = avg(ReadOutput.TLBList[startIndex:endIndex])
	L1CM = avg(ReadOutput.l1DataCacheMissesList[startIndex:endIndex])
	L2CM = avg(ReadOutput.l2DataCacheMissesList[startIndex:endIndex])
	L3CM = avg(ReadOutput.l3TotalCacheMissesList[startIndex:endIndex])
	
	GnuplotFile.write(str(alphabetSize) +" "+ str(Walltime) +" "+ str(BranchMissRate) +" "+ str(BranchMis) +" "+ str(TLB) +" "+ str(L1CM) +" "+ str(L2CM) +" "+ str(L3CM) +"\n")

GnuplotFile.close()

GnuScriptFileName = '../NaiveIntegerAlphabetsize.gnu'
cwd = 'Report/Gnuplot/Graphs'
subprocess.Popen(['gnuplot', GnuScriptFileName], cwd=cwd).wait()