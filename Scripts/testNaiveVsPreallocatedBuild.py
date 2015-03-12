#!/usr/bin/python3

import subprocess
import os.path
from time import sleep

amount = 8
alphabetSize = 12
skew = 2
program = "dist/Release/GNU-Linux-x86/preallocated"
cwd = 'Code/Simple/Preallocated'
outputFilename = 'NaiveVsPreallocatedBuild_n7as12.output'

def addNewline():
	open('Output/'+outputFilename, 'a').write('\n')

subprocess.Popen(['make','CONF=Release', 'clean'], cwd=cwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=cwd).wait()

print("Preallocated: Build \n")
for i in range(0, 5): #run 5 times
	args = [program, str(amount), str(alphabetSize), str(skew), 'build', str(0), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'build', str(1), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'build', str(2), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()


program = "dist/Release/GNU-Linux-x86/naiveinteger"
cwd = 'Code/Simple/NaiveInteger'
subprocess.Popen(['make','CONF=Release', 'clean'], cwd=cwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=cwd).wait()
print("Naive: Build \n")
for i in range(0, 5): #run 5 times
	args = [program, str(amount), str(alphabetSize), str(skew), 'build', str(0), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'build', str(1), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'build', str(2), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()