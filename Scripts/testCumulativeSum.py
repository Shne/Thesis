#!/usr/bin/python3

import subprocess
import os.path
from time import sleep

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


addNewline()

print("CumulativeSum: Build \n")
test = 'build'
for _ in range(repeats):
	args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
	subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
	args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(1), str(blockSize), outputFilename]
	subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
	args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(2), str(blockSize), outputFilename]
	subprocess.Popen(args, cwd=cumulativeSumCwd).wait()

addNewline()

print("CumulativeSum: Rank \n")
test = 'rank'
for _ in range(repeats):
	args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
	subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
	args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(1), str(blockSize), outputFilename]
	subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
	args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(2), str(blockSize), outputFilename]
	subprocess.Popen(args, cwd=cumulativeSumCwd).wait()

addNewline()

print("CumulativeSum: Select Branching \n")
test = 'select'
for _ in range(repeats):
	args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
	subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
	args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(1), str(blockSize), outputFilename]
	subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
	args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(2), str(blockSize), outputFilename]
	subprocess.Popen(args, cwd=cumulativeSumCwd).wait()

addNewline()

print("CumulativeSum: Select Branchless \n")
test = 'select'
for _ in range(repeats):
	args = [cumulativeSumBranchlessProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
	subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
	args = [cumulativeSumBranchlessProgram, str(amount), str(alphabetSize), test, str(1), str(blockSize), outputFilename]
	subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
	args = [cumulativeSumBranchlessProgram, str(amount), str(alphabetSize), test, str(2), str(blockSize), outputFilename]
	subprocess.Popen(args, cwd=cumulativeSumCwd).wait()


addNewline()
addNewline()