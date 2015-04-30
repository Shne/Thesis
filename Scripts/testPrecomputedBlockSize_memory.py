#!/usr/bin/python3

import subprocess
import os.path
from time import sleep

amount = 8
alphabetSize = 16

naiveIntegerProgram = "dist/Release/GNU-Linux-x86/naiveinteger"
naiveIntegerCwd = 'Code/Simple/NaiveInteger'
preallocatedPrecomputedProgram = "dist/Release/GNU-Linux-x86/preallocatedprecomputed"
preallocatedPrecomputedCwd = 'Code/Simple/PreallocatedPrecomputed'
unalignedPreallocatedPrecomputedProgram = "dist/Release/GNU-Linux-x86/unalignedpreallocatedprecomputed"
unalignedPreallocatedPrecomputedCwd = 'Code/Simple/UnalignedPreallocatedPrecomputed'
naivePrecomputedProgram = "dist/Release/GNU-Linux-x86/naiveprecomputed"
naivePrecomputedCwd = 'Code/Simple/NaivePrecomputed'
unalignedNaivePrecomputedProgram = "dist/Release/GNU-Linux-x86/unalignednaiveprecomputed"
unalignedNaivePrecomputedCwd = 'Code/Simple/UnalignedNaivePrecomputed'

outputFilename = 'PrecomputedRankBlockSize_n8as16_build.output'

def addNewline():
	open('Output/'+outputFilename, 'a').write('\n')

subprocess.Popen(['make','CONF=Release', 'clean'], cwd=naiveIntegerCwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=naiveIntegerCwd).wait()
subprocess.Popen(['make','CONF=Release', 'clean'], cwd=preallocatedPrecomputedCwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=preallocatedPrecomputedCwd).wait()
subprocess.Popen(['make','CONF=Release', 'clean'], cwd=naivePrecomputedCwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=naivePrecomputedCwd).wait()
subprocess.Popen(['make','CONF=Release', 'clean'], cwd=unalignedNaivePrecomputedCwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=unalignedNaivePrecomputedCwd).wait()

repeats = 5

pageSize = 4096
quartPage = int(pageSize/4)
blockSizeRange = range(quartPage, pageSize*2 +1, quartPage)

print("NaiveInteger Build")
test = 'build'
skew = 2
for _ in range(repeats):
	args = [naiveIntegerProgram, str(amount), str(alphabetSize), str(skew), test, str(0), outputFilename]
	subprocess.Popen(args, cwd=naiveIntegerCwd).wait()

addNewline()

print("NaivePrecomputed: Build \n")
for blockSize in blockSizeRange:
	test = 'build'
	for _ in range(repeats):
		args = [naivePrecomputedProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=naivePrecomputedCwd).wait()

addNewline()

print("UnalignedNaivePrecomputed: Build \n")
for blockSize in blockSizeRange:
	test = 'build'
	for _ in range(repeats):
		args = [unalignedNaivePrecomputedProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=unalignedNaivePrecomputedCwd).wait()

addNewline()

print("PreallocatedPrecomputed: Build \n")
for blockSize in blockSizeRange:
	test = 'build'
	for _ in range(repeats):
		args = [preallocatedPrecomputedProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=preallocatedPrecomputedCwd).wait()

addNewline()

print("UnalignedPreallocatedPrecomputed: Build \n")
for blockSize in blockSizeRange:
	test = 'build'
	for _ in range(repeats):
		args = [unalignedPreallocatedPrecomputedProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=unalignedPreallocatedPrecomputedCwd).wait()

addNewline()
addNewline()