#!/usr/bin/python3

import subprocess
import os.path
from time import sleep

amount = 8
alphabetSize = 31242
skew = 2
program = "dist/Release/GNU-Linux-x86/naiveinteger"
cwd = 'Code/Simple/NaiveInteger'
outputFilename = 'NonUniformBuildAndQuery.output'

def addNewline():
	open('Output/'+outputFilename, 'a').write('\n')

def frange(x, y, jump):
  while x < y:
    yield x
    x += jump

subprocess.Popen(['make','CONF=Release', 'clean'], cwd=cwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=cwd).wait()


print("NonUniform NaiveInteger: Build")
for i in range(0, 10): #run 10 times for each skew
	args = [program, str(amount), str(alphabetSize), str(skew), 'build', str(0), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'build', str(1), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'build', str(2), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
addNewline()

print("NonUniform NaiveInteger: Rank")
for i in range(0, 10):
	args = [program, str(amount), str(alphabetSize), str(skew), 'rank', str(0), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'rank', str(1), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'rank', str(2), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
addNewline()

print("NonUniform NaiveInteger: Select")
for i in range(0, 10):
	args = [program, str(amount), str(alphabetSize), str(skew), 'select', str(0), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'select', str(1), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'select', str(2), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
addNewline()
addNewline()

# remember to recompile with NON_UNIFORM not defined in main.cpp and rename executable to naiveintegerUniform
program = "dist/Release/GNU-Linux-x86/naiveintegerUniform"
cwd = 'Code/Simple/NaiveInteger'
outputFilename = 'UniformBuildAndQuery.output'


print("Uniform NaiveInteger: Build")
for i in range(0, 10): #run 10 times for each skew
	args = [program, str(amount), str(alphabetSize), str(skew), 'build', str(0), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'build', str(1), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'build', str(2), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
addNewline()

print("Uniform NaiveInteger: Rank")
for i in range(0, 10): #run 10 times for each skew
	args = [program, str(amount), str(alphabetSize), str(skew), 'rank', str(0), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'rank', str(1), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'rank', str(2), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
addNewline()

print("Uniform NaiveInteger: Select")
for i in range(0, 10):
	args = [program, str(amount), str(alphabetSize), str(skew), 'select', str(0), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'select', str(1), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'select', str(2), outputFilename]
	subprocess.Popen(args, cwd=cwd).wait()
addNewline()
addNewline()