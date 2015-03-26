#!/usr/bin/python3

import numpy
import ReadOutput
import subprocess

testsPerSize = 5

def avg(list):
	return sum(list)/len(list)


def writeGnuplotData():
	ReadOutput.getData(testDataFile, "SimpleNaiveInteger", "build")
	for i in range(int(len(ReadOutput.alphabetSizeList)/testsPerSize)):
		startIndex = i*testsPerSize
		endIndex = startIndex + testsPerSize

		naive_mem_size = avg(ReadOutput.memSizeList[startIndex:endIndex])
		naive_mem_resident = avg(ReadOutput.memResidentList[startIndex:endIndex])
		naive_mem_highwater = avg(ReadOutput.memHighWatermarkList[startIndex:endIndex])

		

	ReadOutput.getData(testDataFile, "Preallocated", "build")
	for i in range(int(len(ReadOutput.alphabetSizeList)/testsPerSize)):
		startIndex = i*testsPerSize
		endIndex = startIndex + testsPerSize

		prealloc_mem_size = avg(ReadOutput.memSizeList[startIndex:endIndex])
		prealloc_mem_resident = avg(ReadOutput.memResidentList[startIndex:endIndex])
		prealloc_mem_highwater = avg(ReadOutput.memHighWatermarkList[startIndex:endIndex])

	GnuplotFile.write("0 " + str(naive_mem_size) +"\n")
	GnuplotFile.write("1 " + str(prealloc_mem_size) +"\n")
	GnuplotFile.write("2\n")
	GnuplotFile.write("3 " + str(naive_mem_resident) +"\n")
	GnuplotFile.write("4 " + str(prealloc_mem_resident) +"\n")
	GnuplotFile.write("5\n")
	GnuplotFile.write("6 " + str(naive_mem_highwater) +"\n")
	GnuplotFile.write("7 " + str(prealloc_mem_highwater) +"\n")



GnuplotFile = open("Report/Gnuplot/Data/NaiveVsPreallocatedBuild_n7as12.data", "w")
testDataFile = 'Output/NaiveVsPreallocatedBuild_n7as12.output'
writeGnuplotData()

GnuplotFile = open("Report/Gnuplot/Data/NaiveVsPreallocatedBuild_n8as12.data", "w")
testDataFile = 'Output/NaiveVsPreallocatedBuild_n8as12.output'
writeGnuplotData()

GnuplotFile.close()


GnuScriptFileName = '../NaiveVsPreallocatedBuild.gnu'
cwd = 'Report/Gnuplot/Graphs'
subprocess.Popen(['gnuplot', GnuScriptFileName], cwd=cwd).wait()

