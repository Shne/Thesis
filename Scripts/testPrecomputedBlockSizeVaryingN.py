#!/usr/bin/python3

import subprocess
import os.path
from time import sleep

alphabetSize = 16

unalignedNaivePrecomputedProgram = "dist/Release/GNU-Linux-x86/unalignednaiveprecomputed"
unalignedNaivePrecomputedCwd = 'Code/Simple/UnalignedNaivePrecomputed'

outputFilename = 'PrecomputedRankBlockSizeVaryN_as16.output'

def addNewline():
	open('Output/'+outputFilename, 'a').write('\n')

subprocess.Popen(['make','CONF=Release', 'clean'], cwd=unalignedNaivePrecomputedCwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=unalignedNaivePrecomputedCwd).wait()

repeats = 5
blockSizeRange = [(2**x)/8 for x in range(6, 18+1)]
amounts = range(5,9)

print("UnalignedNaivePrecomputed: Rank \n")
for amount in amounts:
	addNewline()
	for blockSize in blockSizeRange:
		test = 'rank'
		for _ in range(repeats):
			outputFilename = 'PrecomputedRankBlockSizeVaryN_n'+amount+'as16.output'
			args = [unalignedNaivePrecomputedProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
			subprocess.Popen(args, cwd=unalignedNaivePrecomputedCwd).wait()

addNewline()
addNewline()

# print("UnalignedNaivePrecomputed: Select \n")
# for amount in amounts:
# 	addNewline()
# 	for blockSize in blockSizeRange:
# 		test = 'select'
# 		for _ in range(repeats):
# 			args = [unalignedNaivePrecomputedProgram, str(amount), str(alphabetSize), test, str(0), str(blockSize), outputFilename]
# 			subprocess.Popen(args, cwd=unalignedNaivePrecomputedCwd).wait()


# addNewline()
# addNewline()