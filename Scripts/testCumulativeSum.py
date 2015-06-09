#!/usr/bin/python3

import subprocess
import os.path
from time import sleep
import ReadOutput
import numpy as np

amount = 8
alphabetSize = 16

unalignedNaivePrecomputedProgram = "dist/Release/GNU-Linux-x86/unalignednaiveprecomputed"
unalignedNaivePrecomputedCwd = 'Code/Simple/UnalignedNaivePrecomputed'
cumulativeSumProgram = "dist/Release/GNU-Linux-x86/cumulativesum"
cumulativeSumCwd = 'Code/Simple/CumulativeSum'
cumulativeSumBranchlessProgram = "dist/ReleaseBranchlessSelect/GNU-Linux-x86/cumulativesum"

outputFilename = 'CumulativeSum_n8as16.output'


def addNewline():
	open('Output/'+outputFilename, 'a').write('\n')

subprocess.Popen(['make','CONF=Release', 'clean'], cwd=unalignedNaivePrecomputedCwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=unalignedNaivePrecomputedCwd).wait()
subprocess.Popen(['make','CONF=Release', 'clean'], cwd=cumulativeSumCwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=cumulativeSumCwd).wait()
subprocess.Popen(['make','CONF=ReleaseBranchlessSelect', 'clean'], cwd=cumulativeSumCwd).wait()
subprocess.Popen(['make','CONF=ReleaseBranchlessSelect'], cwd=cumulativeSumCwd).wait()

repeats = 5

pageSize = 4096
blockSize = pageSize/2
# quartPage = int(pageSize/4)
# blockSizeRange = range(quartPage, pageSize*2 +1, quartPage)


print("UnalignedNaivePrecomputed: Build \n")
test = 'build'
for _ in range(repeats):
	args = [unalignedNaivePrecomputedProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
	subprocess.Popen(args, cwd=unalignedNaivePrecomputedCwd).wait()
	args = [unalignedNaivePrecomputedProgram, str(amount), str(alphabetSize), test, str(1), str(blockSize), outputFilename]
	subprocess.Popen(args, cwd=unalignedNaivePrecomputedCwd).wait()
	args = [unalignedNaivePrecomputedProgram, str(amount), str(alphabetSize), test, str(2), str(blockSize), outputFilename]
	subprocess.Popen(args, cwd=unalignedNaivePrecomputedCwd).wait()

addNewline()

print("UnalignedNaivePrecomputed: Rank \n")
test = 'rank'
for _ in range(repeats):
	args = [unalignedNaivePrecomputedProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
	subprocess.Popen(args, cwd=unalignedNaivePrecomputedCwd).wait()
	args = [unalignedNaivePrecomputedProgram, str(amount), str(alphabetSize), test, str(1), str(blockSize), outputFilename]
	subprocess.Popen(args, cwd=unalignedNaivePrecomputedCwd).wait()
	args = [unalignedNaivePrecomputedProgram, str(amount), str(alphabetSize), test, str(2), str(blockSize), outputFilename]
	subprocess.Popen(args, cwd=unalignedNaivePrecomputedCwd).wait()

addNewline()

print("UnalignedNaivePrecomputed: Select \n")
test = 'select'
for _ in range(repeats):
	args = [unalignedNaivePrecomputedProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
	subprocess.Popen(args, cwd=unalignedNaivePrecomputedCwd).wait()
	args = [unalignedNaivePrecomputedProgram, str(amount), str(alphabetSize), test, str(1), str(blockSize), outputFilename]
	subprocess.Popen(args, cwd=unalignedNaivePrecomputedCwd).wait()
	args = [unalignedNaivePrecomputedProgram, str(amount), str(alphabetSize), test, str(2), str(blockSize), outputFilename]
	subprocess.Popen(args, cwd=unalignedNaivePrecomputedCwd).wait()



blockSizeList = []
walltimeList = []
def WriteData(i, testsPerSize):
	startIndex = i*testsPerSize
	endIndex = startIndex + testsPerSize
	blockSizeList.append(avg(ReadOutput.blockSizeList[startIndex:endIndex]))
	walltimeList.append(avg(ReadOutput.wallTimeList[startIndex:endIndex]))

#Get best rank block size
ReadOutput.getData('Output/CumulativeSumBlockSizeZoomedRank_n8as16_1000Queries.output', "CumulativeSum", "rank")
for i in range(0, 40):
	WriteData(i, 5)
ReadOutput.reset()
index = np.argmax(np.array(walltimeList))
blockSizeRank = int(blockSizeList[index])
bestBlockSizeFile.write('Rank: ' + str(blockSizeRank) +', ' + str(walltimeList[index]) + '\n')


#Get best select block size.
ReadOutput.getData('Output/CumulativeSumBlockSize_n8as16_1000Queries.output', "CumulativeSum", "select")
blockSizeList = []
walltimeList = []
for i in range(0, 40):
	WriteData(i, 5)
ReadOutput.reset()
index = np.argmax(np.array(walltimeList))
blockSizeSelect = int(blockSizeList[index])
bestBlockSizeFile.write('Select: ' + str(blockSizeSelect) +', ' + str(walltimeList[index]) + '\n')

Get best select branchless block size.
ReadOutput.getData('Output/CumulativeSumBlockSize_n8as16_1000Queries.output', "CumulativeSum", "selectBranchless")
blockSizeList = []
walltimeList = []
for i in range(0, 40):
	WriteData(i, 5)
ReadOutput.reset()
index = np.argmax(np.array(walltimeList))
blockSizeSelectBranchless = int(blockSizeList[index])
bestBlockSizeFile.write('Select: ' + str(blockSizeSelect) +', ' + str(walltimeList[index]) + '\n')

#Get best build block size.
ReadOutput.getData('Output/CumulativeSumBlockSize_n8as16_1000Queries.output', "CumulativeSum", "build")
blockSizeList = []
walltimeList = []
for i in range(0, 40):
	WriteData(i, 5)
ReadOutput.reset()
index = np.argmax(np.array(walltimeList))
blockSizeBuild = int(blockSizeList[index])
bestBlockSizeFile.write('Select: ' + str(blockSizeSelect) +', ' + str(walltimeList[index]) + '\n')


addNewline()
print("CumulativeSum: Build \n")
test = 'build'
for _ in range(repeats):
	args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(0), str(blockSizeBuild/8), outputFilename]
	subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
	args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(1), str(blockSizeBuild/8), outputFilename]
	subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
	args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(2), str(blockSizeBuild/8), outputFilename]
	subprocess.Popen(args, cwd=cumulativeSumCwd).wait()

addNewline()

print("CumulativeSum: Rank \n")
test = 'rank'
for _ in range(repeats):
	args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(0), str(blockSizeRank/8), outputFilename]
	subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
	args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(1), str(blockSizeRank/8), outputFilename]
	subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
	args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(2), str(blockSizeRank/8), outputFilename]
	subprocess.Popen(args, cwd=cumulativeSumCwd).wait()

addNewline()

print("CumulativeSum: Select Branching \n")
test = 'select'
for _ in range(repeats):
	args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(0), str(blockSizeSelect/8), outputFilename]
	subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
	args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(1), str(blockSizeSelect/8), outputFilename]
	subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
	args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(2), str(blockSizeSelect/8), outputFilename]
	subprocess.Popen(args, cwd=cumulativeSumCwd).wait()

addNewline()

print("CumulativeSum: Select Branchless \n")
test = 'select'
for _ in range(repeats):
	args = [cumulativeSumBranchlessProgram, str(amount), str(alphabetSize), test, str(0), str(blockSizeSelectBranchless/8), outputFilename]
	subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
	args = [cumulativeSumBranchlessProgram, str(amount), str(alphabetSize), test, str(1), str(blockSizeSelectBranchless/8), outputFilename]
	subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
	args = [cumulativeSumBranchlessProgram, str(amount), str(alphabetSize), test, str(2), str(blockSizeSelectBranchless/8), outputFilename]
	subprocess.Popen(args, cwd=cumulativeSumCwd).wait()


addNewline()
addNewline()