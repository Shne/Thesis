#!/usr/bin/python3

import subprocess
import os.path
from time import sleep

amount = 8
alphabetSize = 16

cumulativeSumProgram = "dist/Release/GNU-Linux-x86/cumulativesum"
cumulativeSumCwd = 'Code/Simple/CumulativeSum'
cumulativeSumBranchlessProgram = "dist/ReleaseBranchlessSelect/GNU-Linux-x86/cumulativesum"

outputFilename = 'CumulativeSumBlockSize_n8as16.output'


def addNewline():
	open('Output/'+outputFilename, 'a').write('\n')

subprocess.Popen(['make','CONF=Release', 'clean'], cwd=cumulativeSumCwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=cumulativeSumCwd).wait()
subprocess.Popen(['make','CONF=ReleaseBranchlessSelect', 'clean'], cwd=cumulativeSumCwd).wait()
subprocess.Popen(['make','CONF=ReleaseBranchlessSelect'], cwd=cumulativeSumCwd).wait()

repeats = 1


blockSizes = [0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11, 11.5, 12]


print("CumulativeSum: Rank \n")
test = 'rank'
for blockSize in blockSizes:
	for _ in range(repeats):
		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()

addNewline()

print("CumulativeSum: Select Branching \n")
test = 'select'
for blockSize in blockSizes:
	for _ in range(repeats):
		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()

addNewline()

print("CumulativeSum: Select Branchless \n")
test = 'select'
for blockSize in blockSizes:
	for _ in range(repeats):
		args = [cumulativeSumBranchlessProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()

addNewline()
addNewline()