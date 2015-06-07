#!/usr/bin/python3

import subprocess
import os.path
from time import sleep

amount = 8
alphabetSize = 16

cumulativeSumProgram = "dist/CumulativeSumMoreQueries/GNU-Linux-x86/cumulativesum"
cumulativeSumCwd = 'Code/Simple/CumulativeSum'
cumulativeSumBranchlessProgram = "dist/ReleaseBranchlessSelect/GNU-Linux-x86/cumulativesum"

outputFilename = 'CumulativeSumBlockSize_n8as16_10000Queries.output'


def addNewline():
	open('Output/'+outputFilename, 'a').write('\n')



subprocess.Popen(['make','CONF=CumulativeSumMoreQueries', 'clean'], cwd=cumulativeSumCwd).wait()
subprocess.Popen(['make','CONF=CumulativeSumMoreQueries'], cwd=cumulativeSumCwd).wait()
subprocess.Popen(['make','CONF=ReleaseBranchlessSelect', 'clean'], cwd=cumulativeSumCwd).wait()
subprocess.Popen(['make','CONF=ReleaseBranchlessSelect'], cwd=cumulativeSumCwd).wait()


repeats = 5

blockSizes = [i*128 for i in range(1, 41)]
blockSizes2 = [i*0.5 for i in range(1, 41)]




print("CumulativeSum: Rank \n")
test = 'rank'
for blockSize in blockSizes:
	for _ in range(repeats):
		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize/8), outputFilename]
		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()

addNewline()

print("CumulativeSum: Select Branching \n")
test = 'select'
for blockSize in blockSizes:
	for _ in range(repeats):
		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize/8), outputFilename]
		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()

print("CumulativeSum: Build \n")
test = 'build'
for blockSize in blockSizes:
	for _ in range(repeats):
		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize/8), outputFilename]
		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()

addNewline()

print("CumulativeSum: Select Branchless \n")
test = 'select'
for blockSize in blockSizes:
	for _ in range(repeats):
		args = [cumulativeSumBranchlessProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize/8), outputFilename]
		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()

addNewline()


outputFilename = 'CumulativeSumBlockSizeZoomedRank_n8as16_10000Queries.output'
print("CumulativeSum: Rank zoomed\n")
test = 'rank'
for blockSize in blockSizes2:
	for _ in range(repeats):
		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize/8), outputFilename]
		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()

addNewline()

