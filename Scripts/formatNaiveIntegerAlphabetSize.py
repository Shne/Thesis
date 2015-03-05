#!/usr/bin/python3

import numpy
import ReadOutput
import subprocess

GnuplotFile = open("Report/Gnuplot/Data/NaiveIntegerAlphabetsize.data", "w")
testDataFile = 'Output/naiveIntegerAlphabetSize.output'
testsPerSize = 5

def median(list):
	return int(numpy.median(numpy.array(list)))

# RANK
# NO POPCOUNT
ReadOutput.getData(testDataFile, "SimpleNaiveInteger", "build")


for i in range(int(len(ReadOutput.alphabetSizeList)/testsPerSize)):
	startIndex = i*testsPerSize
	endIndex = startIndex + testsPerSize

	alphabetSize = median(ReadOutput.alphabetSizeList[startIndex:endIndex])
	Cycles = median(ReadOutput.totalCyclesArray[startIndex:endIndex])
	Walltime = median(ReadOutput.wallTimeArray[startIndex:endIndex])
	BranchMis = median(ReadOutput.branchMispredictionsArray[startIndex:endIndex])
	TLB = median(ReadOutput.TLBArray[startIndex:endIndex])
	L1CM = median(ReadOutput.l1TotalCacheMissesArray[startIndex:endIndex])
	L2CM = median(ReadOutput.l2TotalCacheMissesArray[startIndex:endIndex])
	L3CM = median(ReadOutput.l3TotalCacheMissesArray[startIndex:endIndex])

	GnuplotFile.write(str(alphabetSize) +" "+ str(Walltime) +" "+ str(BranchMis) +" "+ str(TLB) +" "+ str(L1CM) +" "+ str(L2CM) +" "+ str(L3CM) +"\n")

GnuplotFile.close()

GnuScriptFileName = '../NaiveIntegerAlphabetsize.gnu'
cwd = 'Report/Gnuplot/Graphs'
subprocess.Popen(['gnuplot', GnuScriptFileName], cwd=cwd).wait()