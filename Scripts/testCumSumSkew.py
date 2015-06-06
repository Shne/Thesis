#!/usr/bin/python3

import subprocess
import os.path
from time import sleep

amount = 8
alphabetSize = 16

cumulativeSumProgram = "dist/Release/GNU-Linux-x86/cumulativesumskew"
cumulativeSumCwd = 'Code/Simple/CumulativeSumSkew'

outputFilename = 'CumulativeSumSkew_n8as16.output'

def addNewline():
	open('Output/'+outputFilename, 'a').write('\n')

def frange(x, y, jump):
	while x < y:
		yield x
		x += jump

subprocess.Popen(['make','CONF=Release', 'clean'], cwd=cumulativeSumCwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=cumulativeSumCwd).wait()

repeats = 5

blockSizeRank = 1
blockSizeSelect = 256
skewStart = 2
skewEnd = 6.1
skewStep = 0.2

print("CumulativeSum: Build \n")
test = 'build'
for skew in frange(skewStart, skewEnd, skewStep):
	for _ in range(repeats):
		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(0), str(blockSizeSelect), outputFilename, str(skew)]
		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(1), str(blockSizeSelect), outputFilename, str(skew)]
		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(2), str(blockSizeSelect), outputFilename, str(skew)]
		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()

addNewline()

print("CumulativeSum: Rank \n")
test = 'rank'
for skew in frange(skewStart, skewEnd, skewStep):
	for _ in range(repeats):
		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(0), str(blockSizeRank), outputFilename, str(skew)]
		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(1), str(blockSizeRank), outputFilename, str(skew)]
		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(2), str(blockSizeRank), outputFilename, str(skew)]
		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()

addNewline()

print("CumulativeSum: Select \n")
test = 'select'
for skew in frange(skewStart, skewEnd, skewStep):
	for _ in range(repeats):
		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(0), str(blockSizeSelect), outputFilename, str(skew)]
		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(1), str(blockSizeSelect), outputFilename, str(skew)]
		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(2), str(blockSizeSelect), outputFilename, str(skew)]
		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()


addNewline()
addNewline()