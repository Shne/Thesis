#!/usr/bin/python3

import ReadOutput
import numpy
import subprocess
import os.path

def getNumberOfEqualSkews(skewList):
	stepsize = 0
	for skew in skewList:
		if(skew == 2.0):
			stepsize += 1

		if(skew > 2.0):
			break
	return stepsize

def getSkewsIncreaseFactor(skewList):
	stepsize = 0.0
	for skew in skewList:		
		if(skew > 2.0):
			stepsize = skew - 2.0
			break
	return float("{0:.1f}".format(stepsize))

def getAverageValues(skewList, otherList):
	stepsize = getNumberOfEqualSkews(skewList)
	runningTimeAverage = []

	for i in range(0, len(otherList), stepsize):
		temp = []
		for j in range(i, stepsize+i):
			temp.append(otherList[j])
		average = numpy.average(numpy.array(temp))
		runningTimeAverage.append(average)

	return runningTimeAverage


def getNumberOfDifferentSkewValues(skewList):
	return len(skewList)/int(getNumberOfEqualSkews(skewList))

def getUniqueSkewValues(skewList):
	numberOfSkews = int(getNumberOfDifferentSkewValues(skewList))
	skewIncreaseFactor = getSkewsIncreaseFactor(skewList)
	uniqueSkews = []
	skew = 2.0
	uniqueSkews.append(skew)	
	for i in range(1, numberOfSkews):
		skew += skewIncreaseFactor
		uniqueSkews.append(skew)
	return uniqueSkews

def writeToGnuplot(outputFile, valueListsKeys, testDataFile, constructionAlg, test, columns):
	ReadOutput.getData(testDataFile, constructionAlg, test)

	outputFile.write(columns+"\n")
	valueLists = ReadOutput.getReadOutputLists(valueListsKeys)
	seperatingValues = valueLists[0]
	valueLists.remove(seperatingValues)

	averageValueListList = []
	for lst in valueLists:
		averageValueListList.append(getAverageValues(seperatingValues, lst))

	uniqueSeperators = getUniqueSkewValues(seperatingValues)
	index = 0
	for skew in uniqueSeperators:
		strToWrite = "{0:.1f}".format(skew)
		for averageValueList in averageValueListList:
			strToWrite += "   " + str(int(averageValueList[index]))
		outputFile.write(strToWrite +"\n")
		index+=1

	ReadOutput.reset();

testDataFile = 'Output/Query_NaiveVsControlledNodeMemorySkew-1000queries.output'

naiveRankGnuplotFile = open("Report/Gnuplot/Data/naiveRankSkew.data", "w")
naiveSelectGnuplotFile = open("Report/Gnuplot/Data/naiveSelectSkew.data", "w")
controlledNodeMemoryRankGnuplotFile = open("Report/Gnuplot/Data/controlledNodeMemoryRankSkew.data", "w")
controlledNodeMemorySelectGnuplotFile = open("Report/Gnuplot/Data/controlledNodeMemorySelectSkew.data", "w")
columns = "#[skew]   [L1-DataCache-Misses]   [L2-DataCache-Misses]   [L3-TotalCache-Misses]   [Branch-Misses]   [TLB]   [Conditional Branches]   [Wall time (micro seconds)]   [L2-DataCache-Hits]"
testValueDataListKeys = ["skewArray", "l1DataCacheMissesArray", "l2DataCacheMissesArray", "l3TotalCacheMissesArray", 
"branchMispredictionsArray", "TLBArray", "conditionalBranchesArray", "wallTimeArray", "l2DataCacheHitsArray"]

GnuScriptFileName = '../NaiveVsControlledNodeMemoryQuerySkew.gnu'
writeToGnuplot(naiveRankGnuplotFile, testValueDataListKeys, testDataFile, "SimpleNaiveInteger", "rank", columns)
writeToGnuplot(naiveSelectGnuplotFile, testValueDataListKeys, testDataFile, "SimpleNaiveInteger", "select", columns)
writeToGnuplot(controlledNodeMemoryRankGnuplotFile, testValueDataListKeys, testDataFile, "ControlledNodeMemory", "rank", columns)
writeToGnuplot(controlledNodeMemorySelectGnuplotFile, testValueDataListKeys, testDataFile, "ControlledNodeMemory", "select", columns)
# writeToGnuplot(preallocatedRankGnuplotFile, testValueDataListKeys, testDataFile, "Preallocated", "rank", columns)
# writeToGnuplot(preallocatedSelectGnuplotFile, testValueDataListKeys, testDataFile, "Preallocated", "select", columns)

naiveRankGnuplotFile.close()
naiveSelectGnuplotFile.close()
controlledNodeMemoryRankGnuplotFile.close()
controlledNodeMemorySelectGnuplotFile.close()
# preallocatedRankGnuplotFile.close()
# preallocatedSelectGnuplotFile.close()

cwd = 'Report/Gnuplot/Graphs'
subprocess.Popen(['gnuplot', GnuScriptFileName], cwd=cwd).wait()
