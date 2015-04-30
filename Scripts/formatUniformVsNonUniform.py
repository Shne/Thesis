#!/usr/bin/python3

import ReadOutput
import numpy
import subprocess
import os.path
import math
import Utils

def writeGnuplotHeader(gnuplotFile):
	gnuplotFile.write("#[xValue] [alphabetSize] [Walltime] [BlockSize] [BranchMissRate] [BranchMis] [BranchExe] [TLB] [L1CM] [L2CM] [L2CH] [L3CM]")
	gnuplotFile.write(" [Cycles] [WalltimeErr] [BranchMissRateErr] [BranchMisErr] [BranchExeErr] [TLBErr] [L1CMErr] [L2CMErr] [L2CHErr]")
	gnuplotFile.write(" [L3CMErr] [CyclesErr] [WallTimePercent]\n")

def formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize, xValue):	
	for i in range(int(len(ReadOutput.alphabetSizeList)/testsPerSize)):
		startIndex = i*testsPerSize
		endIndex = startIndex + testsPerSize

		alphabetSize = Utils.avg(ReadOutput.alphabetSizeList[startIndex:endIndex])
		blockSize = Utils.avg(ReadOutput.blockSizeList[startIndex:endIndex])
		Cycles = Utils.avg(ReadOutput.totalCyclesList[startIndex:endIndex])
		Walltime = Utils.avg(ReadOutput.wallTimeList[startIndex:endIndex])
		BranchMis = Utils.avg(ReadOutput.branchMispredictionsList[startIndex:endIndex])
		BranchExe = Utils.avg(ReadOutput.branchExecutedList[startIndex:endIndex])
		BranchMissRate = numpy.average(ReadOutput.branchMissRateList[startIndex:endIndex])
		TLB = Utils.avg(ReadOutput.TLBList[startIndex:endIndex])
		L1CM = Utils.avg(ReadOutput.l1DataCacheMissesList[startIndex:endIndex])
		L2CM = Utils.avg(ReadOutput.l2DataCacheMissesList[startIndex:endIndex])
		L2CH = Utils.avg(ReadOutput.l2DataCacheHitsList[startIndex:endIndex])
		L3CM = Utils.avg(ReadOutput.l3TotalCacheMissesList[startIndex:endIndex])

		CyclesErr = numpy.std(ReadOutput.totalCyclesList[startIndex:endIndex])
		WalltimeErr = numpy.std(ReadOutput.wallTimeList[startIndex:endIndex])
		BranchMisErr = numpy.std(ReadOutput.branchMispredictionsList[startIndex:endIndex])
		BranchExeErr = numpy.std(ReadOutput.branchExecutedList[startIndex:endIndex])
		BranchMissRateErr = numpy.std(ReadOutput.branchMissRateList[startIndex:endIndex])
		TLBErr = numpy.std(ReadOutput.TLBList[startIndex:endIndex])
		L1CMErr = numpy.std(ReadOutput.l1DataCacheMissesList[startIndex:endIndex])
		L2CMErr = numpy.std(ReadOutput.l2DataCacheMissesList[startIndex:endIndex])
		L2CHErr = numpy.std(ReadOutput.l2DataCacheHitsList[startIndex:endIndex])
		L3CMErr = numpy.std(ReadOutput.l3TotalCacheMissesList[startIndex:endIndex])

		gnuplotFile.write(str(xValue) +" "+ 
			str(alphabetSize)+" "+
			str(Walltime)+" "+
			str(blockSize)+" "+
			str(BranchMissRate)+" "+
			str(BranchMis)+" "+
			str(BranchExe)+" "+
			str(TLB)+" "+
			str(L1CM)+" "+
			str(L2CM)+" "+
			str(L2CH)+" "+
			str(L3CM)+" "+
			str(Cycles)+" "+
			str(WalltimeErr)+" "+
			str(BranchMissRateErr)+" "+
			str(BranchMisErr)+" "+
			str(BranchExeErr)+" "+
			str(TLBErr)+" "+
			str(L1CMErr)+" "+
			str(L2CMErr)+" "+
			str(L2CHErr)+" "+
			str(L3CMErr)+" "+
			str(CyclesErr)+"\n"
		)

testsPerSize = 5

#Uniform
testDataFile = 'Output/UniformBuildAndQuery.output'
gnuplotFile = open("Report/Gnuplot/Data/NaiveInteger_Build_Uniform.data", "w")
writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "SimpleNaiveInteger", "build")
formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize, 2)
ReadOutput.reset()

#Non Uniform
testDataFile = 'Output/NonUniformBuildAndQuery.output'
gnuplotFile = open("Report/Gnuplot/Data/NaiveInteger_Build_NonUniform.data", "w")
writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "SimpleNaiveInteger", "build")
formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize, 1)
ReadOutput.reset()


#Uniform
testDataFile = 'Output/UniformBuildAndQuery.output'
gnuplotFile = open("Report/Gnuplot/Data/NaiveInteger_Rank_Uniform.data", "w")
writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "SimpleNaiveInteger", "rank")
formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize, 2)
ReadOutput.reset()

#Non Uniform
testDataFile = 'Output/NonUniformBuildAndQuery.output'
gnuplotFile = open("Report/Gnuplot/Data/NaiveInteger_Rank_NonUniform.data", "w")
writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "SimpleNaiveInteger", "rank")
formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize, 1)
ReadOutput.reset()


#Uniform
testDataFile = 'Output/UniformBuildAndQuery.output'
gnuplotFile = open("Report/Gnuplot/Data/NaiveInteger_Select_Uniform.data", "w")
writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "SimpleNaiveInteger", "select")
formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize, 2)
ReadOutput.reset()

#Non Uniform
testDataFile = 'Output/NonUniformBuildAndQuery.output'
gnuplotFile = open("Report/Gnuplot/Data/NaiveInteger_Select_NonUniform.data", "w")
writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "SimpleNaiveInteger", "select")
formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize, 1)
ReadOutput.reset()

gnuplotFile.close()

GnuScriptFileName = '../UniformVsNonUniform.gnu'
cwd = 'Report/Gnuplot/Graphs'
subprocess.Popen(['gnuplot', GnuScriptFileName], cwd=cwd).wait()