#!/usr/bin/python3

import ReadOutput
import subprocess
import Utils

testDataFile = 'Output/PrecomputedRankBlockSize_n8as16.output'
dataListKeys = ["alphabetSizeList", "blockSizeList", "wallTimeList", "branchMissRateList", "branchMispredictionsList", "TLBList", "l1DataCacheMissesList", "l2DataCacheMissesList", "l3TotalCacheMissesList"]


# NAIVEINTEGER
testsPerSize = 1
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data", "w")
Utils.writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "SimpleNaiveInteger", "rank")
Utils.formatAndWriteValues(ReadOutput, gnuplotFile, dataListKeys, testsPerSize)
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSize_NaiveInteger_Select.data", "w")
Utils.writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "SimpleNaiveInteger", "select")
Utils.formatAndWriteValues(ReadOutput, gnuplotFile, dataListKeys, testsPerSize)


#PREALLOCATED PRECOMPUTED
testsPerSize = 1
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data", "w")
Utils.writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "PreallocatedPrecomputed", "rank")
Utils.formatAndWriteValues(ReadOutput, gnuplotFile, dataListKeys, testsPerSize)
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data", "w")
Utils.writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "PreallocatedPrecomputed", "select")
Utils.formatAndWriteValues(ReadOutput, gnuplotFile, dataListKeys, testsPerSize)


#NAIVE PRECOMPUTED
testsPerSize = 1
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data", "w")
Utils.writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "NaivePrecomputed", "rank")
Utils.formatAndWriteValues(ReadOutput, gnuplotFile, dataListKeys, testsPerSize)
gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data", "w")
Utils.writeGnuplotHeader(gnuplotFile)
ReadOutput.getData(testDataFile, "NaivePrecomputed", "select")
Utils.formatAndWriteValues(ReadOutput, gnuplotFile, dataListKeys, testsPerSize)


#UNALIGNED NAIVE PRECOMPUTED
# testsPerSize = 1
# gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data", "w")
# Utils.writeGnuplotHeader(gnuplotFile)
# ReadOutput.getData(testDataFile, "UnalignedNaivePrecomputed", "rank")
# Utils.formatAndWriteValues(ReadOutput, gnuplotFile, dataListKeys, testsPerSize)
# gnuplotFile = open("Report/Gnuplot/Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data", "w")
# Utils.writeGnuplotHeader(gnuplotFile)
# ReadOutput.getData(testDataFile, "UnalignedNaivePrecomputed", "select")
# Utils.formatAndWriteValues(ReadOutput, gnuplotFile, dataListKeys, testsPerSize)