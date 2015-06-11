#!/usr/bin/python3

import subprocess
import os.path
from time import sleep
import re, mmap
import numpy as np
import ReadOutput

amount = 8
alphabetSize = 16

cumulativeSumProgram = "dist/Release/GNU-Linux-x86/cumulativesumskew"
cumulativeSumCwd = 'Code/Simple/CumulativeSumSkew'

outputFilename = 'CumulativeSumSkew_n8as16.output'

memoryOutputFilename = 'CumulativeSumSkew_n8as16_build_memory.output'
tempOutFile = "CumulativeSumSkew_n8as16_build.tmp"
manualSnapshotFileName = "massifBuildMemorySnapshot"
massif = ["valgrind", "--tool=massif", "--stacks=yes", "--detailed-freq=1000000", "--max-snapshots=10", "--massif-out-file=../../../"+tempOutFile]


def addNewline():
	open('Output/'+outputFilename, 'a').write('\n')

def frange(x, y, jump):
	while x < y:
		yield x
		x += jump

def clampFloat(f):
	return "{0:.1f}".format(f)

def writeMassifData(programName, skew):
	manualSnapshotFile = open(manualSnapshotFileName, "r+")
	tempData = mmap.mmap(manualSnapshotFile.fileno(), 0)
	m = compiledRegex.search(tempData)
	manualSnapshotFile.close()
	f = open('Output/'+memoryOutputFilename, 'a')
	f.write("algorithm="+programName+" ")
	f.write("skew="+clampFloat(skew)+" ")
	f.write("heap="+str(int(m.group('heap')))+" ")
	f.write("extra="+str(int(m.group('extra')))+" ")
	f.write("stacks="+str(int(m.group('stacks')))+" ")
	f.write("\n")
	f.close()


blockSizeRank = 64/8
blockSizeSelect = 2048/8
blockSizeBuild = 1024/8

repeats = 5
skewStart = 2
skewEnd = 6.1
skewStep = 0.2

subprocess.Popen(['make','CONF=Release', 'clean'], cwd=cumulativeSumCwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=cumulativeSumCwd).wait()


addNewline()
addNewline()
addNewline()


skewRange = [2.0, 2.4, 6.0]
print("CumulativeSum: Rank \n")
test = 'rank'
# for skew in frange(skewStart, skewEnd, skewStep):
for skew in skewRange:
	for _ in range(repeats):
		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(0), str(blockSizeRank), outputFilename, clampFloat(skew)]
		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(1), str(blockSizeRank), outputFilename, clampFloat(skew)]
		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(2), str(blockSizeRank), outputFilename, clampFloat(skew)]
		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()

addNewline()

# print("CumulativeSum: Select \n")
# test = 'select'
# for skew in frange(skewStart, skewEnd, skewStep):
# 	for _ in range(repeats):
# 		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(0), str(blockSizeSelect), outputFilename, clampFloat(skew)]
# 		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
# 		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(1), str(blockSizeSelect), outputFilename, clampFloat(skew)]
# 		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
# 		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(2), str(blockSizeSelect), outputFilename, clampFloat(skew)]
# 		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()

# regex = b"mem_heap_B=(?P<heap>\d+)\nmem_heap_extra_B=(?P<extra>\d+)\nmem_stacks_B=(?P<stacks>\d+)\nheap_tree=empty$"
# compiledRegex = re.compile(regex)

# addNewline()

# print("CumulativeSum: Build Time\n")
# test = 'build'
# for skew in frange(skewStart, skewEnd, skewStep):
# 	for _ in range(repeats):
# 		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(0), str(blockSizeBuild), outputFilename, clampFloat(skew)]
# 		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
# 		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(1), str(blockSizeBuild), outputFilename, clampFloat(skew)]
# 		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
# 		args = [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(2), str(blockSizeBuild), outputFilename, clampFloat(skew)]
# 		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()

# addNewline()

# print("CumulativeSum: Build Memory \n")
# test = 'buildmemory'
# blockSize = blockSizeSelect
# for skew in frange(skewStart, skewEnd, skewStep):
# 	for _ in range(repeats):
# 		args = massif + [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(0), str(blockSizeBuild), outputFilename, clampFloat(skew)]
# 		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
# 		writeMassifData('CumulativeSum', skew)

# os.remove(tempOutFile)
# os.remove(manualSnapshotFileName)





addNewline()
addNewline()