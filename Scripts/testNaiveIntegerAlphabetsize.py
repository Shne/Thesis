#!/usr/bin/python3

import subprocess
import os.path
from time import sleep

amount = 7
skew = 2
program = "dist/Release/GNU-Linux-x86/naiveinteger"
cwd = 'Code/Simple/NaiveInteger'
outputFilename = 'naiveIntegerAlphabetSize.output'

def addNewline():
	open('Output/'+outputFilename, 'a').write('\n')

# program = "dist/Release/GNU-Linux-x86/preallocated"
# cwd = 'Code/Simple/Preallocated'

subprocess.Popen(['make','CONF=Release', 'clean'], cwd=cwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=cwd).wait()

addNewline()

for alphabetSize in range(19,21):
	for _ in range(5):
		args = [program, str(amount), str(alphabetSize), str(skew), 'build', str(0), outputFilename]
		subprocess.Popen(args, cwd=cwd).wait()
		args = [program, str(amount), str(alphabetSize), str(skew), 'build', str(1), outputFilename]
		subprocess.Popen(args, cwd=cwd).wait()

addNewline()
