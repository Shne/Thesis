#!/usr/bin/python3

import numpy
import ReadOutput
import subprocess

GnuplotFile = open("Report/Gnuplot/Data/NaiveIntegerAlphabetsize.data", "w")
testDataFile = 'Output/naiveIntegerAlphabetSize.output'
testsPerSize = 5

def median(list):
	return int(numpy.median(numpy.array(list)))

def avg(list):
	return sum(list)/len(list)

ReadOutput.getData(testDataFile, "SimpleNaiveInteger", "build")

#LARGE N
for i in range(int(len(ReadOutput.alphabetSizeList)/testsPerSize)):
	startIndex = i*testsPerSize
	endIndex = startIndex + testsPerSize

	alphabetSize = avg(ReadOutput.alphabetSizeList[startIndex:endIndex])
	Cycles = avg(ReadOutput.totalCyclesArray[startIndex:endIndex])
	Walltime = avg(ReadOutput.wallTimeArray[startIndex:endIndex])
	BranchMis = avg(ReadOutput.branchMispredictionsArray[startIndex:endIndex])
	BranchExe = avg(ReadOutput.branchExecutedList[startIndex:endIndex])
	TLB = avg(ReadOutput.TLBArray[startIndex:endIndex])
	L1CM = avg(ReadOutput.l1DataCacheMissesArray[startIndex:endIndex])
	L2CM = avg(ReadOutput.l2DataCacheMissesArray[startIndex:endIndex])
	L3CM = avg(ReadOutput.l3TotalCacheMissesArray[startIndex:endIndex])

	GnuplotFile.write(str(alphabetSize) +" "+ str(Walltime) +" "+ str(BranchMis/BranchExe) +" "+ str(BranchMis) +" "+ str(TLB) +" "+ str(L1CM) +" "+ str(L2CM) +" "+ str(L3CM) +"\n")

GnuplotFile.close()

GnuScriptFileName = '../NaiveIntegerAlphabetsize.gnu'
cwd = 'Report/Gnuplot/Graphs'
subprocess.Popen(['gnuplot', GnuScriptFileName], cwd=cwd).wait()


# SMALL N
GnuplotFile = open("Report/Gnuplot/Data/naiveIntegerAlphabetSize_smallN.data", "w")
testDataFile = 'Output/naiveIntegerAlphabetSize_smallN.output'
testsPerSize = 5

ReadOutput.getData(testDataFile, "SimpleNaiveInteger", "build")

for i in range(int(len(ReadOutput.alphabetSizeList)/testsPerSize)):
	startIndex = i*testsPerSize
	endIndex = startIndex + testsPerSize

	alphabetSize = avg(ReadOutput.alphabetSizeList[startIndex:endIndex])
	Cycles = avg(ReadOutput.totalCyclesArray[startIndex:endIndex])
	Walltime = avg(ReadOutput.wallTimeArray[startIndex:endIndex])
	BranchMis = avg(ReadOutput.branchMispredictionsArray[startIndex:endIndex])
	BranchExe = avg(ReadOutput.branchExecutedList[startIndex:endIndex])
	TLB = avg(ReadOutput.TLBArray[startIndex:endIndex])
	L1CM = avg(ReadOutput.l1DataCacheMissesArray[startIndex:endIndex])
	L2CM = avg(ReadOutput.l2DataCacheMissesArray[startIndex:endIndex])
	L3CM = avg(ReadOutput.l3TotalCacheMissesArray[startIndex:endIndex])

	GnuplotFile.write(str(alphabetSize) +" "+ str(Walltime) +" "+ str(BranchMis/BranchExe) +" "+ str(BranchMis) +" "+ str(TLB) +" "+ str(L1CM) +" "+ str(L2CM) +" "+ str(L3CM) +"\n")

GnuplotFile.close()