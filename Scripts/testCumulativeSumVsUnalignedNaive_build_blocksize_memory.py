#!/usr/bin/python3

import subprocess
# import os.path
import os
from time import sleep
import re, mmap
import sys

amount = 8
alphabetSize = 16

# naiveIntegerProgram = "dist/Release/GNU-Linux-x86/naiveinteger"
# naiveIntegerCwd = 'Code/Simple/NaiveInteger'
# preallocatedPrecomputedProgram = "dist/Release/GNU-Linux-x86/preallocatedprecomputed"
# preallocatedPrecomputedCwd = 'Code/Simple/PreallocatedPrecomputed'
# unalignedPreallocatedPrecomputedProgram = "dist/Release/GNU-Linux-x86/unalignedpreallocatedprecomputed"
# unalignedPreallocatedPrecomputedCwd = 'Code/Simple/UnalignedPreallocatedPrecomputed'
# naivePrecomputedProgram = "dist/Release/GNU-Linux-x86/naiveprecomputed"
# naivePrecomputedCwd = 'Code/Simple/NaivePrecomputed'
unalignedNaivePrecomputedProgram = "dist/Release/GNU-Linux-x86/unalignednaiveprecomputed"
unalignedNaivePrecomputedCwd = 'Code/Simple/UnalignedNaivePrecomputed'
cumulativeSumProgram = "dist/Release/GNU-Linux-x86/cumulativesum"
cumulativeSumCwd = 'Code/Simple/CumulativeSum'

outputFilename = 'CumulativeSumVsUnalignedNaive_build_blocksize.output'
memoryOutputFilename = 'CumulativeSumVsUnalignedNaive_build_blocksize_memory.output'
tempOutFile = "CumulativeSumVsUnalignedNaive_build_blocksize.tmp"
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


subprocess.Popen(['make','CONF=Release', 'clean'], cwd=unalignedNaivePrecomputedCwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=unalignedNaivePrecomputedCwd).wait()
subprocess.Popen(['make','CONF=Release', 'clean'], cwd=cumulativeSumCwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=cumulativeSumCwd).wait()


blockSizeRange = []  
for i in range(1, 41):
	blockSizeRange.append(i*128)


test = 'buildmemory'
repeats = 2



regex = b"mem_heap_B=(?P<heap>\d+)\nmem_heap_extra_B=(?P<extra>\d+)\nmem_stacks_B=(?P<stacks>\d+)\nheap_tree=empty$"
compiledRegex = re.compile(regex)

programName = "UnalignedNaivePrecomputed"
print(programName)
for blockSize in blockSizeRange:
	for _ in range(repeats):
		args = massif + [unalignedNaivePrecomputedProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize/8), outputFilename]
		subprocess.Popen(args, cwd=unalignedNaivePrecomputedCwd).wait()
		writeMassifData(programName, blockSize)
addNewline()

programName = "CumulativeSum"
print(programName)
for blockSize in blockSizeRange:
	for _ in range(repeats):
		args = massif + [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize/8), outputFilename]
		subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
		writeMassifData(programName, blockSize)
addNewline()

os.remove(tempOutFile)
os.remove(manualSnapshotFileName)