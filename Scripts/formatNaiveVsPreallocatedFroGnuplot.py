#!/usr/bin/python3

import ReadOutput

naiveRankGnuplotFile = open("Report/Gnuplot/naiveRankSkewRunningTime.data", "w")
naiveSelectGnuplotFile = open("Report/Gnuplot/naiveSelectSkewRunningTime.data", "w")
preallocatedRankGnuplotFile = open("Report/Gnuplot/preallocatedRankSkewRunningTime.data", "w")
preallocatedSelectGnuplotFile = open("Report/Gnuplot/preallocatedSelectSkewRunningTime.data", "w")
testDataFile = 'Output/Query_NaiveVsPreallocatedSkew.output'

ReadOutput.getData(testDataFile, "SimpleNaiveInteger", "rank")
naiveRankGnuplotFile.write("#[skew]   [Wall Time]\n")
index = 0
for skew in ReadOutput.skewArray:
	naiveRankGnuplotFile.write(str(skew)+ "   " + str(ReadOutput.wallTimeArray[index]) +"\n")
	index+=1


ReadOutput.getData(testDataFile, "SimpleNaiveInteger", "select")
naiveSelectGnuplotFile.write("#[skew]   [Wall Time]\n")
index = 0
for skew in ReadOutput.skewArray:
	naiveSelectGnuplotFile.write(str(skew)+ "   " + str(ReadOutput.wallTimeArray[index]) +"\n")
	index+=1


ReadOutput.getData(testDataFile, "Preallocated", "rank")
preallocatedRankGnuplotFile.write("#[skew]   [Wall Time]\n")
index = 0
for skew in ReadOutput.skewArray:
	preallocatedRankGnuplotFile.write(str(skew)+ "   " + str(ReadOutput.wallTimeArray[index]) +"\n")
	index+=1


ReadOutput.getData(testDataFile, "Preallocated", "select")
preallocatedSelectGnuplotFile.write("#[skew]   [Wall Time]\n")
index = 0
for skew in ReadOutput.skewArray:
	preallocatedSelectGnuplotFile.write(str(skew)+ "   " + str(ReadOutput.wallTimeArray[index]) +"\n")
	index+=1



