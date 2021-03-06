#!/usr/bin/python3

import subprocess
# import os.path
import os
from time import sleep
import re, mmap
import sys

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
memoryOutputFilename = 'PrecomputedRankBlockSize_n8as16_build_memory.output'
tempOutFile = "PrecomputedRankBlockSize_n8as16_build.tmp"
manualSnapshotFileName = "massifBuildMemorySnapshot"
massif = ["valgrind", "--tool=massif", "--stacks=yes", "--detailed-freq=1000000", "--max-snapshots=10", "--massif-out-file=../../../"+tempOutFile]


def addNewline():
	open('Output/'+outputFilename, 'a').write('\n')

def writeMassifData(programName, blockSize):
	manualSnapshotFile = open(manualSnapshotFileName, "r+")
	tempData = mmap.mmap(manualSnapshotFile.fileno(), 0)
	m = compiledRegex.search(tempData)
	manualSnapshotFile.close()
	f = open('Output/'+memoryOutputFilename, 'a')
	f.write("algorithm="+programName+" ")
	f.write("blockSize="+str(blockSize)+" ")
	f.write("heap="+str(int(m.group('heap')))+" ")
	f.write("extra="+str(int(m.group('extra')))+" ")
	f.write("stacks="+str(int(m.group('stacks')))+" ")
	f.write("\n")
	f.close()

subprocess.Popen(['make','CONF=Release', 'clean'], cwd=naiveIntegerCwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=naiveIntegerCwd).wait()
subprocess.Popen(['make','CONF=Release', 'clean'], cwd=preallocatedPrecomputedCwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=preallocatedPrecomputedCwd).wait()
subprocess.Popen(['make','CONF=Release', 'clean'], cwd=unalignedPreallocatedPrecomputedCwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=unalignedPreallocatedPrecomputedCwd).wait()
subprocess.Popen(['make','CONF=Release', 'clean'], cwd=naivePrecomputedCwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=naivePrecomputedCwd).wait()
subprocess.Popen(['make','CONF=Release', 'clean'], cwd=unalignedNaivePrecomputedCwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=unalignedNaivePrecomputedCwd).wait()

pageSize = 4096
quartPage = int(pageSize/4)
blockSizeRange = range(quartPage, pageSize*2 +1, quartPage)
test = 'buildmemory'
repeats = 5


"(?P<alphabetSize>\d+)"
regex = b"mem_heap_B=(?P<heap>\d+)\nmem_heap_extra_B=(?P<extra>\d+)\nmem_stacks_B=(?P<stacks>\d+)\nheap_tree=empty$"
compiledRegex = re.compile(regex)

programName = "NaiveInteger"
print(programName)
skew = 2
for _ in range(repeats):
	args = massif + [naiveIntegerProgram, str(amount), str(alphabetSize), str(skew), test, str(0), outputFilename]
	subprocess.Popen(args, cwd=naiveIntegerCwd).wait()
	writeMassifData(programName, 'N/A')
addNewline()

programName = "PreallocatedPrecomputed"
print(programName)
for blockSize in blockSizeRange:
	for _ in range(repeats):
		args = massif + [preallocatedPrecomputedProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=preallocatedPrecomputedCwd).wait()
		writeMassifData(programName, blockSize)
addNewline()

programName = "UnalignedPreallocatedPrecomputed"
print(programName)
for blockSize in blockSizeRange:
	for _ in range(repeats):
		args = massif + [unalignedPreallocatedPrecomputedProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=unalignedPreallocatedPrecomputedCwd).wait()
		writeMassifData(programName, blockSize)
addNewline()

programName = "NaivePrecomputed"
print(programName)
for blockSize in blockSizeRange:
	for _ in range(repeats):
		args = massif + [naivePrecomputedProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=naivePrecomputedCwd).wait()
		writeMassifData(programName, blockSize)
addNewline()

programName = "UnalignedNaivePrecomputed"
print(programName)
for blockSize in blockSizeRange:
	for _ in range(repeats):
		args = massif + [unalignedNaivePrecomputedProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
		subprocess.Popen(args, cwd=unalignedNaivePrecomputedCwd).wait()
		writeMassifData(programName, blockSize)
addNewline()

os.remove(tempOutFile)
os.remove(manualSnapshotFileName)