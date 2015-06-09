#!/usr/bin/python3

import subprocess
import os.path
from time import sleep

amount = 8
alphabetSize = 16

# cumulativeSumProgram = "dist/CumulativeSumMoreQueries/GNU-Linux-x86/cumulativesum"
cumulativeSumProgram = "dist/Release/GNU-Linux-x86/cumulativesum"
cumulativeSumCwd = 'Code/Simple/CumulativeSum'
cumulativeSumBranchlessProgram = "dist/ReleaseBranchlessSelect/GNU-Linux-x86/cumulativesum"
unalignedNaivePrecomputedProgram = "dist/Release/GNU-Linux-x86/unalignednaiveprecomputed"
unalignedNaivePrecomputedCwd = 'Code/Simple/UnalignedNaivePrecomputed'


outputFilename = 'CumulativeSumBlockSize_n8as16_1000Queries.output'


def addNewline():
	open('Output/'+outputFilename, 'a').write('\n')



subprocess.Popen(['make','CONF=Release', 'clean'], cwd=cumulativeSumCwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=cumulativeSumCwd).wait()
subprocess.Popen(['make','CONF=ReleaseBranchlessSelect', 'clean'], cwd=cumulativeSumCwd).wait()
subprocess.Popen(['make','CONF=ReleaseBranchlessSelect'], cwd=cumulativeSumCwd).wait()
subprocess.Popen(['make','CONF=Release', 'clean'], cwd=unalignedNaivePrecomputedCwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=unalignedNaivePrecomputedCwd).wait()


repeats = 5

blockSizes = [i*128 for i in range(1, 41)]
blockSizes2 = [i*0.5 for i in range(1, 33)]
blockSizes3 = [2**i for i in range(3, 17)]


# print("CumulativeSum: Select Branching \n")
# test = 'select'
# for blockSize in blockSizes3:
# 	for _ in range(repeats):
# 		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize/8), outputFilename]
# 		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
addNewline()


print("CumulativeSum: Rank \n")
test = 'rank'
for blockSize in blockSizes3:
	for _ in range(repeats):
		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize/8), outputFilename]
		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()

addNewline()

outputFilename = 'CumulativeSumBlockSizeZoomedRank_n8as16_1000Queries.output'
print("CumulativeSum: Rank zoomed\n")
test = 'rank'
for blockSize in blockSizes2:
	for _ in range(repeats):
		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()

addNewline()

print("UnalignedNaive: Build \n")
test = 'build'
for blockSize in blockSizes3:
	for _ in range(repeats):
		args = [unalignedNaivePrecomputedProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize/8), outputFilename]
		subprocess.Popen(args, cwd=unalignedNaivePrecomputedCwd).wait()

addNewline()

print("CumulativeSum: Build \n")
test = 'build'
for blockSize in blockSizes3:
	for _ in range(repeats):
		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize/8), outputFilename]
		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()

addNewline()



# print("CumulativeSum: Select Branchless \n")
# test = 'select'
# for blockSize in blockSizes3:
# 	for _ in range(repeats):
# 		args = [cumulativeSumBranchlessProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize/8), outputFilename]
# 		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()

# addNewline()

