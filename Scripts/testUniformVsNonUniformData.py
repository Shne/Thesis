#!/usr/bin/python3

import subprocess
import os.path
from time import sleep

amount = 8
alphabetSize = 31241
skew = 2
program = "dist/Release/GNU-Linux-x86/naiveinteger"
cwd = 'Code/Simple/NaiveInteger'
outputFilename = 'NonUniformBuildAndQuery.output'
datatype = "NonUniform"

def addNewline():
	open('Output/'+outputFilename, 'a').write('\n')


subprocess.Popen(['make','CONF=Release', 'clean'], cwd=cwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=cwd).wait()


print("NonUniform NaiveInteger: Build")
for i in range(0, 5): 
	args = [program, str(amount), str(alphabetSize), str(skew), 'build', str(0), outputFilename, datatype]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'build', str(1), outputFilename, datatype]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'build', str(2), outputFilename, datatype]
	subprocess.Popen(args, cwd=cwd).wait()
addNewline()

print("NonUniform NaiveInteger: Rank")
for i in range(0, 5):
	args = [program, str(amount), str(alphabetSize), str(skew), 'rank', str(0), outputFilename, datatype]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'rank', str(1), outputFilename, datatype]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'rank', str(2), outputFilename, datatype]
	subprocess.Popen(args, cwd=cwd).wait()
addNewline()

print("NonUniform NaiveInteger: Select")
for i in range(0, 5):
	args = [program, str(amount), str(alphabetSize), str(skew), 'select', str(0), outputFilename, datatype]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'select', str(1), outputFilename, datatype]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'select', str(2), outputFilename, datatype]
	subprocess.Popen(args, cwd=cwd).wait()
addNewline()
addNewline()


outputFilename = 'UniformBuildAndQuery.output'
datatype = "Uniform"
print("Uniform NaiveInteger: Build")
for i in range(0, 5): 
	args = [program, str(amount), str(alphabetSize), str(skew), 'build', str(0), outputFilename, datatype]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'build', str(1), outputFilename, datatype]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'build', str(2), outputFilename, datatype]
	subprocess.Popen(args, cwd=cwd).wait()
addNewline()

print("Uniform NaiveInteger: Rank")
for i in range(0, 5): 
	args = [program, str(amount), str(alphabetSize), str(skew), 'rank', str(0), outputFilename, datatype]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'rank', str(1), outputFilename, datatype]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'rank', str(2), outputFilename, datatype]
	subprocess.Popen(args, cwd=cwd).wait()
addNewline()

print("Uniform NaiveInteger: Select")
for i in range(0, 5):
	args = [program, str(amount), str(alphabetSize), str(skew), 'select', str(0), outputFilename, datatype]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'select', str(1), outputFilename, datatype]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'select', str(2), outputFilename, datatype]
	subprocess.Popen(args, cwd=cwd).wait()
addNewline()
addNewline()