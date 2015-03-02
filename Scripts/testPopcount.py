#!/usr/bin/python3

import subprocess
import os.path
from time import sleep

amount = 8
alphabetSize = 12
skew = 2
program = "dist/Release/GNU-Linux-x86/naiveinteger"
cwd = 'Code/Simple/NaiveInteger'
outputFilename = 'testPopcount.output'

def addNewline():
	open('Output/'+outputFilename, 'a').write('\n')

subprocess.Popen(['make','CONF=Release', 'clean'], cwd=cwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=cwd).wait()

for _ in range(5):
	args = [program, str(amount), str(alphabetSize), str(skew), 'rank', str(0), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'rank', str(1), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()

addNewline()

for _ in range(5):
	args = [program, str(amount), str(alphabetSize), str(skew), 'select', str(0), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'select', str(1), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()

addNewline()
addNewline()