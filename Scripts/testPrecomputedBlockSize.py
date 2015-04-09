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
naivePrecomputedProgram = "dist/Release/GNU-Linux-x86/naiveprecomputed"
naivePrecomputedCwd = 'Code/Simple/NaivePrecomputed'
unalignedNaivePrecomputedProgram = "dist/Release/GNU-Linux-x86/unalignednaiveprecomputed"
unalignedNaivePrecomputedCwd = 'Code/Simple/UnalignedNaivePrecomputed'

outputFilename = 'PrecomputedRankBlockSize_n8as16.output'

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
# blockSizeRange = [pageSize/4, pageSize/2, pageSize, pageSize*2, pageSize*3, pageSize*4, pageSize*5, pageSize*6]
blockSizeRange = [pageSize/5, pageSize/3] # and not using pageSize*6

print("NaiveInteger Rank")
test = 'rank'
skew = 2
for _ in range(repeats):
	args = [naiveIntegerProgram, str(amount), str(alphabetSize), str(skew), test, str(0), outputFilename]
	subprocess.Popen(args, cwd=naiveIntegerCwd).wait()
	args = [naiveIntegerProgram, str(amount), str(alphabetSize), str(skew), test, str(1), outputFilename]
	subprocess.Popen(args, cwd=naiveIntegerCwd).wait()
	args = [naiveIntegerProgram, str(amount), str(alphabetSize), str(skew), test, str(2), outputFilename]
	subprocess.Popen(args, cwd=naiveIntegerCwd).wait()

addNewline()

print("NaiveInteger Select")
test = 'select'
for _ in range(repeats):
	args = [naiveIntegerProgram, str(amount), str(alphabetSize), str(skew), test, str(0), outputFilename]
	subprocess.Popen(args, cwd=naiveIntegerCwd).wait()
	args = [naiveIntegerProgram, str(amount), str(alphabetSize), str(skew), test, str(1), outputFilename]
	subprocess.Popen(args, cwd=naiveIntegerCwd).wait()
	args = [naiveIntegerProgram, str(amount), str(alphabetSize), str(skew), test, str(2), outputFilename]
	subprocess.Popen(args, cwd=naiveIntegerCwd).wait()

addNewline()

print("PrecomputedPages: Rank \n")
for blockSize in blockSizeRange:
	test = 'rank'
	for _ in range(repeats):
		args = [preallocatedPrecomputedProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=preallocatedPrecomputedCwd).wait()
		args = [preallocatedPrecomputedProgram, str(amount), str(alphabetSize), test, str(1), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=preallocatedPrecomputedCwd).wait()
		args = [preallocatedPrecomputedProgram, str(amount), str(alphabetSize), test, str(2), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=preallocatedPrecomputedCwd).wait()

addNewline()

print("PrecomputedPages: Select \n")
for blockSize in blockSizeRange:
	test = 'select'
	for _ in range(repeats):
		args = [preallocatedPrecomputedProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=preallocatedPrecomputedCwd).wait()
		args = [preallocatedPrecomputedProgram, str(amount), str(alphabetSize), test, str(1), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=preallocatedPrecomputedCwd).wait()
		args = [preallocatedPrecomputedProgram, str(amount), str(alphabetSize), test, str(2), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=preallocatedPrecomputedCwd).wait()

addNewline()

print("NaivePrecomputed: Rank \n")
for blockSize in blockSizeRange:
	test = 'rank'
	for _ in range(repeats):
		args = [naivePrecomputedProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=naivePrecomputedCwd).wait()
		args = [naivePrecomputedProgram, str(amount), str(alphabetSize), test, str(1), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=naivePrecomputedCwd).wait()
		args = [naivePrecomputedProgram, str(amount), str(alphabetSize), test, str(2), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=naivePrecomputedCwd).wait()

addNewline()

print("NaivePrecomputed: Select \n")
for blockSize in blockSizeRange:
	test = 'select'
	for _ in range(repeats):
		args = [naivePrecomputedProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=naivePrecomputedCwd).wait()
		args = [naivePrecomputedProgram, str(amount), str(alphabetSize), test, str(1), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=naivePrecomputedCwd).wait()
		args = [naivePrecomputedProgram, str(amount), str(alphabetSize), test, str(2), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=naivePrecomputedCwd).wait()

addNewline()

print("UnalignedNaivePrecomputed: Rank \n")
for blockSize in blockSizeRange:
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
for blockSize in blockSizeRange:
	test = 'select'
	for _ in range(repeats):
		args = [unalignedNaivePrecomputedProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=unalignedNaivePrecomputedCwd).wait()
		args = [unalignedNaivePrecomputedProgram, str(amount), str(alphabetSize), test, str(1), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=unalignedNaivePrecomputedCwd).wait()
		args = [unalignedNaivePrecomputedProgram, str(amount), str(alphabetSize), test, str(2), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=unalignedNaivePrecomputedCwd).wait()


addNewline()
addNewline()