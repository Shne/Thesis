#!/usr/bin/python3

import subprocess
import os.path
from time import sleep

amount = 8
alphabetSize = 16
program = "dist/Release/GNU-Linux-x86/precomputedpages"
cwd = 'Code/Simple/PrecomputedPages'
outputFilename = 'NaiveVsPrecomputedRank_n8as16.output'

def addNewline():
	open('Output/'+outputFilename, 'a').write('\n')

subprocess.Popen(['make','CONF=Release', 'clean'], cwd=cwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=cwd).wait()

addNewline()

blockSize = 2048

print("Precomputed: Rank \n")
for _ in range(5): #run 5 times
	args = [program, str(amount), str(alphabetSize), 'rank', str(0), blockSize, outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), 'rank', str(1), blockSize, outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), 'rank', str(2), blockSize, outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()

addNewline()

# print("Precomputed: Select \n")
# for _ in range(5): #run 5 times
# 	args = [program, str(amount), str(alphabetSize), 'select', str(0), blockSize, outputFilename]
# 	subprocess.Popen(args, cwd=cwd).wait()
# 	args = [program, str(amount), str(alphabetSize), 'select', str(1), blockSize, outputFilename]
# 	subprocess.Popen(args, cwd=cwd).wait()
# 	args = [program, str(amount), str(alphabetSize), 'select', str(2), blockSize, outputFilename]
# 	subprocess.Popen(args, cwd=cwd).wait()

# addNewline()

skew = 2
program = "dist/Release/GNU-Linux-x86/naiveinteger"
cwd = 'Code/Simple/NaiveInteger'
subprocess.Popen(['make','CONF=Release', 'clean'], cwd=cwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=cwd).wait()

print("Naive: Rank \n")
for _ in range(5): #run 5 times
	args = [program, str(amount), str(alphabetSize), str(skew), 'rank', str(0), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'rank', str(1), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'rank', str(2), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()

addNewline()

# print("Naive: Select \n")
# for _ in range(5): #run 5 times
# 	args = [program, str(amount), str(alphabetSize), str(skew), 'select', str(0), outputFilename]
# 	subprocess.Popen(args, cwd=cwd).wait()
# 	args = [program, str(amount), str(alphabetSize), str(skew), 'select', str(1), outputFilename]
# 	subprocess.Popen(args, cwd=cwd).wait()
# 	args = [program, str(amount), str(alphabetSize), str(skew), 'select', str(2), outputFilename]
# 	subprocess.Popen(args, cwd=cwd).wait()

# addNewline()
# addNewline()