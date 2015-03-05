#!/usr/bin/python3

import ReadOutput
import numpy
import subprocess
import os.path

def getNumberOfEqualSkews(skewList):
	stepsize = 0
	for skew in skewList:
		if(skew == 2):
			stepsize += 1

		if(skew > 2):
			break
	return stepsize

def getMedianValues(skewList, otherList):
	stepsize = getNumberOfEqualSkews(skewList)
	runningTimeMedians = []

	for i in range(0, len(otherList), stepsize):
		temp = []
		for j in range(i, stepsize+i):
			temp.append(otherList[j])
		median = numpy.median(numpy.array(temp))
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

def writeToGnuplot(outputFile, valueListsKeys, testDataFile, constructionAlg, test, columns):
	ReadOutput.getData(testDataFile, constructionAlg, test)

	outputFile.write(columns+"\n")
	valueLists = ReadOutput.getReadOutputLists(valueListsKeys)
	seperatingValues = valueLists[0]
	valueLists.remove(seperatingValues)

	medianValueListList = []
	for lst in valueLists:
		medianValueListList.append(getMedianValues(seperatingValues, lst))

	uniqueSeperators = getUniqueSkewValues(seperatingValues)
	index = 0
	for skew in uniqueSeperators:
		strToWrite = str(skew)
		for medianValueList in medianValueListList:
			strToWrite += "   " + str(int(medianValueList[index]))
		outputFile.write(strToWrite +"\n")
		index+=1

	ReadOutput.reset();



naiveRankGnuplotFile = open("Report/Gnuplot/Data/naiveRankSkewRunningTime.data", "w")
naiveSelectGnuplotFile = open("Report/Gnuplot/Data/naiveSelectSkewRunningTime.data", "w")
preallocatedRankGnuplotFile = open("Report/Gnuplot/Data/preallocatedRankSkewRunningTime.data", "w")
preallocatedSelectGnuplotFile = open("Report/Gnuplot/Data/preallocatedSelectSkewRunningTime.data", "w")

# naiveRankGnuplotFile = open("Report/Gnuplot/Data/naiveRankSkewCacheMisses.data", "w")
# naiveSelectGnuplotFile = open("Report/Gnuplot/Data/naiveSelectSkewCacheMisses.data", "w")
# preallocatedRankGnuplotFile = open("Report/Gnuplot/Data/preallocatedRankSkewCacheMisses.data", "w")
# preallocatedSelectGnuplotFile = open("Report/Gnuplot/Data/preallocatedSelectSkewCacheMisses.data", "w")

testDataFile = 'Output/Query_NaiveVsPreallocatedSkew.output'

#Names of columns
# columns = "#[skew]   [L1-Cache-Misses]   [L2-Cache-Misses]   [L3-Cache-Misses]"
columns = "#[skew]   [Wall-Time (microsec)]"

#The data we want in our gnuplot. It is requiered that the first key is data seperating values
# testValueDataListKeys = ["skewArray", "l1TotalCacheMissesArray", "l2TotalCacheMissesArray", "l3TotalCacheMissesArray"]
testValueDataListKeys = ["skewArray", "wallTimeArray"]

writeToGnuplot(naiveRankGnuplotFile, testValueDataListKeys, testDataFile, "SimpleNaiveInteger", "rank", columns)
writeToGnuplot(naiveSelectGnuplotFile, testValueDataListKeys, testDataFile, "SimpleNaiveInteger", "select", columns)
writeToGnuplot(preallocatedRankGnuplotFile, testValueDataListKeys, testDataFile, "Preallocated", "rank", columns)
writeToGnuplot(preallocatedSelectGnuplotFile, testValueDataListKeys, testDataFile, "Preallocated", "select", columns)

naiveRankGnuplotFile.close()
naiveSelectGnuplotFile.close()
preallocatedRankGnuplotFile.close()
preallocatedSelectGnuplotFile.close()

# GnuScriptFileName = '../NaiveVsPreallocatedSkewCacheMissesQueryScript.gnu'
GnuScriptFileName = '../NaiveVsPreallocatedSkewRunningTimeQueryScript.gnu'

cwd = 'Report/Gnuplot/Graphs'
subprocess.Popen(['gnuplot', GnuScriptFileName], cwd=cwd).wait()
