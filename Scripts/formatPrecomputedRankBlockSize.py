#!/usr/bin/python3

import ReadOutput
import subprocess
import Utils

testDataFile = 'Output/PrecomputedRankBlockSize_n8as16.output'
testsPerSize = 5

pageSize = 4096
# blockSizeRange = [int(pageSize/5), int(pageSize/4), int(pageSize/3), int(pageSize/2), int(pageSize-pageSize/3), int(pageSize-pageSize/4), pageSize, int(pageSize+(pageSize/2)), pageSize*2, pageSize*3]
quartPage = int(pageSize/4)
blockSizeRange = range(quartPage, pageSize*2 +1, quartPage)

def PadNaiveInteger(ReadOutput):
	alphabetSize = ReadOutput.alphabetSizeList[:]
	totalCycles = ReadOutput.totalCyclesList[:]
	wallTime = ReadOutput.wallTimeList[:]
	branchMispredictions = ReadOutput.branchMispredictionsList[:]
	branchExecuted = ReadOutput.branchExecutedList[:]
	branchMissRate = ReadOutput.branchMissRateList[:]
	TLB = ReadOutput.TLBList[:]
	l1DataCacheMisses = ReadOutput.l1DataCacheMissesList[:]
	l2DataCacheMisses = ReadOutput.l2DataCacheMissesList[:]
	l2DataCacheHits = ReadOutput.l2DataCacheHitsList[:]
	l3TotalCacheMisses = ReadOutput.l3TotalCacheMissesList[:]
	ReadOutput.reset()
	for blockSize in blockSizeRange:
		for i in range(testsPerSize):
			ReadOutput.alphabetSizeList.append(alphabetSize[i])
			ReadOutput.blockSizeList.append(blockSize*8)
			ReadOutput.totalCyclesList.append(totalCycles[i])
			ReadOutput.wallTimeList.append(wallTime[i])
			ReadOutput.branchMispredictionsList.append(branchMispredictions[i])
			ReadOutput.branchExecutedList.append(branchExecuted[i])
			ReadOutput.branchMissRateList.append(branchMissRate[i])
			ReadOutput.TLBList.append(TLB[i])
			ReadOutput.l1DataCacheMissesList.append(l1DataCacheMisses[i])
			ReadOutput.l2DataCacheMissesList.append(l2DataCacheMisses[i])
			ReadOutput.l2DataCacheHitsList.append(l2DataCacheHits[i])
			ReadOutput.l3TotalCacheMissesList.append(l3TotalCacheMisses[i])

gnuplotFileVsNaive = open("Report/Gnuplot/Data/PrecomputedRankBlockSize_vsNaiveInteger.data", "w")
def outputForPrecomputedVsNot(i):
	startIndex = i*testsPerSize
	endIndex = startIndex + testsPerSize
	wallTimeList = ReadOutput.wallTimeList[startIndex:endIndex]
	gnuplotFileVsNaive.write(str(i)+" "+str(sum(wallTimeList)/len(wallTimeList))+"\n")


# NAIVEINTEGER
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data", "w")
Utils.writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "SimpleNaiveInteger", "rank")
PadNaiveInteger(ReadOutput)
Utils.formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize)
outputForPrecomputedVsNot(0) #for precomputed vs non-precomputed
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSize_NaiveInteger_Select.data", "w")
Utils.writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "SimpleNaiveInteger", "select")
PadNaiveInteger(ReadOutput)
Utils.formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize)
outputForPrecomputedVsNot(1) #for precomputed vs non-precomputed


#PREALLOCATED PRECOMPUTED
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data", "w")
Utils.writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "PreallocatedPrecomputed", "rank")
Utils.formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize)
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data", "w")
Utils.writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "PreallocatedPrecomputed", "select")
Utils.formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize)

#UNALIGNED PREALLOCATED PRECOMPUTED
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data", "w")
Utils.writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "UnalignedPreallocatedPrecomputed", "rank")
Utils.formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize)
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data", "w")
Utils.writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "UnalignedPreallocatedPrecomputed", "select")
Utils.formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize)


#NAIVE PRECOMPUTED
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data", "w")
Utils.writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "NaivePrecomputed", "rank")
Utils.formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize)
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data", "w")
Utils.writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "NaivePrecomputed", "select")
Utils.formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize)


#UNALIGNED NAIVE PRECOMPUTED
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data", "w")
Utils.writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "UnalignedNaivePrecomputed", "rank")
Utils.formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize)
outputForPrecomputedVsNot(2) #for precomputed vs non-precomputed
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data", "w")
Utils.writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "UnalignedNaivePrecomputed", "select")
Utils.formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize)
#for precomputed vs non-precomputed
outputForPrecomputedVsNot(3) #for precomputed vs non-precomputed



#Larger block size range
testDataFile = 'Output/PrecomputedRankBlockSize_n8as16_largerBlocksizeRange.output'
#PREALLOCATED PRECOMPUTED
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSizeLarger_PreallocatedPrecomputed_Rank.data", "w")
Utils.writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "PreallocatedPrecomputed", "rank")
Utils.formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize)
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSizeLarger_PreallocatedPrecomputed_Select.data", "w")
Utils.writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "PreallocatedPrecomputed", "select")
Utils.formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize)

#UNALIGNED PREALLOCATED PRECOMPUTED
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSizeLarger_UnalignedPreallocatedPrecomputed_Rank.data", "w")
Utils.writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "UnalignedPreallocatedPrecomputed", "rank")
Utils.formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize)
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSizeLarger_UnalignedPreallocatedPrecomputed_Select.data", "w")
Utils.writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "UnalignedPreallocatedPrecomputed", "select")
Utils.formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize)


#NAIVE PRECOMPUTED
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSizeLarger_NaivePrecomputed_Rank.data", "w")
Utils.writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "NaivePrecomputed", "rank")
Utils.formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize)
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSizeLarger_NaivePrecomputed_Select.data", "w")
Utils.writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "NaivePrecomputed", "select")
Utils.formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize)


#UNALIGNED NAIVE PRECOMPUTED
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSizeLarger_UnalignedNaivePrecomputed_Rank.data", "w")
Utils.writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "UnalignedNaivePrecomputed", "rank")
Utils.formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize)
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSizeLarger_UnalignedNaivePrecomputed_Select.data", "w")
Utils.writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "UnalignedNaivePrecomputed", "select")
Utils.formatAndWriteValues(ReadOutput, gnuplotFile, testsPerSize)

gnuplotFile.close()
gnuplotFileVsNaive.close()


GnuScriptFileName = '../PrecomputedRankBlockSize.gnu'
cwd = 'Report/Gnuplot/Graphs'
subprocess.Popen(['gnuplot', GnuScriptFileName], cwd=cwd).wait()
