#!/usr/bin/python3

import subprocess
# import os.path
import os
from time import sleep
import re, mmap
import sys

amount = 8
alphabetSize = 16

unalignedNaivePrecomputedProgram = "dist/Release/GNU-Linux-x86/unalignednaiveprecomputed"
unalignedNaivePrecomputedCwd = 'Code/Simple/UnalignedNaivePrecomputed'
cumulativeSumProgram = "dist/Release/GNU-Linux-x86/cumulativesum"
cumulativeSumCwd = 'Code/Simple/CumulativeSum'

outputFilename = 'CumulativeSum_n8as16_build.output'
memoryOutputFilename = 'CumulativeSum_n8as16_build_memory.output'
tempOutFile = "CumulativeSum_n8as16_build.tmp"
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

pageSize = 4096
blockSize = int(pageSize/2)
test = 'buildmemory'
repeats = 5


"(?P<alphabetSize>\d+)"
regex = b"mem_heap_B=(?P<heap>\d+)\nmem_heap_extra_B=(?P<extra>\d+)\nmem_stacks_B=(?P<stacks>\d+)\nheap_tree=empty$"
compiledRegex = re.compile(regex)

programName = "UnalignedNaive"
print(programName)
for _ in range(repeats):
	args = massif + [unalignedNaivePrecomputedProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
	subprocess.Popen(args, cwd=unalignedNaivePrecomputedCwd).wait()
	writeMassifData(programName, blockSize)
addNewline()

programName = "CumulativeSum"
print(programName)
for _ in range(repeats):
	args = massif + [cumulativeSumProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
	subprocess.Popen(args, cwd=cumulativeSumCwd).wait()
	writeMassifData(programName, blockSize)
addNewline()


os.remove(tempOutFile)
os.remove(manualSnapshotFileName)