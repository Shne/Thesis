#!/usr/bin/python3

import ReadOutput
import numpy

def getNumberOfEqualSkews(skewList):
	stepsize = 0
	for skew in skewList:
		if(skew == 2):
			stepsize += 1

		if(skew > 2):
			break
	return stepsize

def getMedianValues(skewList, runningTimeList):
	stepsize = getNumberOfEqualSkews(skewList)
	runningTimeMedians = []

	for i in range(0, len(runningTimeList), stepsize):
		temp = []
		for j in range(i, stepsize+i):
			temp.append(runningTimeList[j])
		print("temp: ")
		print(temp)
		median = numpy.median(numpy.array(temp))		
		print("median: " + str(median))
		print("")
		runningTimeMedians.append(median)

	return runningTimeMedians

# 30258 30304 30463 30501 30638

def getNumberOfDifferentSkewValues(skewList):
	return len(skewList)/int(getNumberOfEqualSkews(skewList))

def getUniqueSkewValues(skewList):
	numberOfSkews = int(getNumberOfDifferentSkewValues(skewList))
	uniqueSkews = []
	skew = 1
	for i in range(0, numberOfSkews):
		skew += 1
		uniqueSkews.append(skew)
	return uniqueSkews

naiveRankGnuplotFile = open("Report/Gnuplot/naiveRankSkewRunningTime.data", "w")
naiveSelectGnuplotFile = open("Report/Gnuplot/naiveSelectSkewRunningTime.data", "w")
preallocatedRankGnuplotFile = open("Report/Gnuplot/preallocatedRankSkewRunningTime.data", "w")
preallocatedSelectGnuplotFile = open("Report/Gnuplot/preallocatedSelectSkewRunningTime.data", "w")
testDataFile = 'Output/Query_NaiveVsPreallocatedSkew.output'

ReadOutput.getData(testDataFile, "SimpleNaiveInteger", "rank")
naiveRankGnuplotFile.write("#[skew]   [Wall Time]\n")
index = 0
madianValues = getMedianValues(ReadOutput.skewArray, ReadOutput.wallTimeArray)
uniqueSkews = getUniqueSkewValues(ReadOutput.skewArray)
for skew in uniqueSkews:
	naiveRankGnuplotFile.write(str(skew)+ "   " + str(int(madianValues[index])) +"\n")
	index+=1
ReadOutput.reset();

ReadOutput.getData(testDataFile, "SimpleNaiveInteger", "select")
naiveSelectGnuplotFile.write("#[skew]   [Wall Time]\n")
index = 0
madianValues = getMedianValues(ReadOutput.skewArray, ReadOutput.wallTimeArray)
uniqueSkews = getUniqueSkewValues(ReadOutput.skewArray)
for skew in uniqueSkews:
	naiveSelectGnuplotFile.write(str(skew)+ "   " + str(int(madianValues[index])) +"\n")
	index+=1
ReadOutput.reset();


ReadOutput.getData(testDataFile, "Preallocated", "rank")
preallocatedRankGnuplotFile.write("#[skew]   [Wall Time]\n")
index = 0
madianValues = getMedianValues(ReadOutput.skewArray, ReadOutput.wallTimeArray)
uniqueSkews = getUniqueSkewValues(ReadOutput.skewArray)
for skew in uniqueSkews:
	preallocatedRankGnuplotFile.write(str(skew)+ "   " + str(int(madianValues[index])) +"\n")
	index+=1
ReadOutput.reset();

ReadOutput.getData(testDataFile, "Preallocated", "select")
preallocatedSelectGnuplotFile.write("#[skew]   [Wall Time]\n")
index = 0
madianValues = getMedianValues(ReadOutput.skewArray, ReadOutput.wallTimeArray)
uniqueSkews = getUniqueSkewValues(ReadOutput.skewArray)
for skew in uniqueSkews:
	preallocatedSelectGnuplotFile.write(str(skew)+ "   " + str(int(madianValues[index])) +"\n")
	index+=1
ReadOutput.reset();

