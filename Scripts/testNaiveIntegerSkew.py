#!/usr/bin/python3

import subprocess
import os.path
from time import sleep

amount = 7
alphabetSize = 16
program = "dist/Release/GNU-Linux-x86/naiveinteger"
cwd = 'Code/Simple/NaiveInteger'
outputFilename = 'Query_NaiveVsPreallocatedSkew-1000queries.output'

def addNewline():
	open('Output/'+outputFilename, 'a').write('\n')

def frange(x, y, jump):
  while x < y:
    yield x
    x += jump

subprocess.Popen(['make','CONF=Release', 'clean'], cwd=cwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=cwd).wait()


# print("Preallocated: Build \n")
# for skew in range(2,11):
# # 	for i in range(0, 5): #run 5 times for each skew
# 	args = [program, str(amount), str(alphabetSize), str(skew), 'build', str(0), outputFilename]
# 	subprocess.Popen(args, cwd=cwd).wait()
# 	args = [program, str(amount), str(alphabetSize), str(skew), 'build', str(1), outputFilename]
# 	subprocess.Popen(args, cwd=cwd).wait()

# addNewline()

skewRange = 6
print("\nNaiveInteger: Rank")
for skew in frange(2,skewRange,0.2):
	for i in range(0, 5): #run 5 times for each skew
		args = [program, str(amount), str(alphabetSize), str(skew), 'rank', str(0), outputFilename]
		subprocess.Popen(args, cwd=cwd).wait()
		args = [program, str(amount), str(alphabetSize), str(skew), 'rank', str(1), outputFilename]
		subprocess.Popen(args, cwd=cwd).wait()
		args = [program, str(amount), str(alphabetSize), str(skew), 'rank', str(2), outputFilename]
		subprocess.Popen(args, cwd=cwd).wait()
addNewline()

print("\nNaiveInteger: Select")
for skew in frange(2,skewRange,0.2):
	for i in range(0, 5): #run 5 times for each skew
		args = [program, str(amount), str(alphabetSize), str(skew), 'select', str(0), outputFilename]
		subprocess.Popen(args, cwd=cwd).wait()
		args = [program, str(amount), str(alphabetSize), str(skew), 'select', str(1), outputFilename]
		subprocess.Popen(args, cwd=cwd).wait()
		args = [program, str(amount), str(alphabetSize), str(skew), 'select', str(2), outputFilename]
		subprocess.Popen(args, cwd=cwd).wait()

addNewline()
addNewline()
