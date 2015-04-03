#!/usr/bin/python3

import subprocess
import os.path
from time import sleep

amount = 8
alphabetSize = 16

naiveIntegerProgram = "dist/Release/GNU-Linux-x86/naiveinteger"
naiveIntegerCwd = 'Code/Simple/NaiveInteger'
precomputedPagesProgram = "dist/Release/GNU-Linux-x86/precomputedpages"
precomputedPagesCwd = 'Code/Simple/PrecomputedPages'
naivePrecomputedProgram = "dist/Release/GNU-Linux-x86/naiveprecomputed"
naivePrecomputedCwd = 'Code/Simple/NaivePrecomputed'

outputFilename = 'PrecomputedRankBlockSize_n8as16.output'

def addNewline():
	open('Output/'+outputFilename, 'a').write('\n')

subprocess.Popen(['make','CONF=Release', 'clean'], cwd=naiveIntegerCwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=naiveIntegerCwd).wait()
subprocess.Popen(['make','CONF=Release', 'clean'], cwd=precomputedPagesCwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=precomputedPagesCwd).wait()
subprocess.Popen(['make','CONF=Release', 'clean'], cwd=naivePrecomputedCwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=naivePrecomputedCwd).wait()

# repeats = 5
repeats = 1

blockSizePowRange = range(10, 17)

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
for blockSizePow in blockSizePowRange:
	blockSize = str(pow(2,blockSizePow))
	test = 'rank'
	for _ in range(repeats):
		args = [precomputedPagesProgram, str(amount), str(alphabetSize), test, str(0), blockSize, outputFilename]
		subprocess.Popen(args, cwd=precomputedPagesCwd).wait()
		args = [precomputedPagesProgram, str(amount), str(alphabetSize), test, str(1), blockSize, outputFilename]
		subprocess.Popen(args, cwd=precomputedPagesCwd).wait()
		args = [precomputedPagesProgram, str(amount), str(alphabetSize), test, str(2), blockSize, outputFilename]
		subprocess.Popen(args, cwd=precomputedPagesCwd).wait()

addNewline()

print("PrecomputedPages: Select \n")
for blockSizePow in blockSizePowRange:
	blockSize = str(pow(2,blockSizePow))
	test = 'select'
	for _ in range(repeats):
		args = [precomputedPagesProgram, str(amount), str(alphabetSize), test, str(0), blockSize, outputFilename]
		subprocess.Popen(args, cwd=precomputedPagesCwd).wait()
		args = [precomputedPagesProgram, str(amount), str(alphabetSize), test, str(1), blockSize, outputFilename]
		subprocess.Popen(args, cwd=precomputedPagesCwd).wait()
		args = [precomputedPagesProgram, str(amount), str(alphabetSize), test, str(2), blockSize, outputFilename]
		subprocess.Popen(args, cwd=precomputedPagesCwd).wait()

addNewline()

print("NaivePrecomputed: Rank \n")
for blockSizePow in blockSizePowRange:
	blockSize = str(pow(2,blockSizePow))
	test = 'rank'
	for _ in range(repeats):
		args = [naivePrecomputedProgram, str(amount), str(alphabetSize), test, str(0), blockSize, outputFilename]
		subprocess.Popen(args, cwd=naivePrecomputedCwd).wait()
		args = [naivePrecomputedProgram, str(amount), str(alphabetSize), test, str(1), blockSize, outputFilename]
		subprocess.Popen(args, cwd=naivePrecomputedCwd).wait()
		args = [naivePrecomputedProgram, str(amount), str(alphabetSize), test, str(2), blockSize, outputFilename]
		subprocess.Popen(args, cwd=naivePrecomputedCwd).wait()

addNewline()

print("NaivePrecomputed: Select \n")
for blockSizePow in blockSizePowRange:
	blockSize = str(pow(2,blockSizePow))
	test = 'select'
	for _ in range(repeats):
		args = [naivePrecomputedProgram, str(amount), str(alphabetSize), test, str(0), blockSize, outputFilename]
		subprocess.Popen(args, cwd=naivePrecomputedCwd).wait()
		args = [naivePrecomputedProgram, str(amount), str(alphabetSize), test, str(1), blockSize, outputFilename]
		subprocess.Popen(args, cwd=naivePrecomputedCwd).wait()
		args = [naivePrecomputedProgram, str(amount), str(alphabetSize), test, str(2), blockSize, outputFilename]
		subprocess.Popen(args, cwd=naivePrecomputedCwd).wait()


addNewline()
addNewline()