#!/usr/bin/python3

import subprocess
import os.path
from time import sleep

amount = 8
alphabetSize = 12
program = "dist/Release/GNU-Linux-x86/naiveinteger"
cwd = 'Code/Simple/NaiveInteger'
outputFilename = 'Query_NaiveVsPreallocatedSkew.output'

def addNewline():
	open('Output/'+outputFilename, 'a').write('\n')

subprocess.Popen(['make','CONF=Release', 'clean'], cwd=cwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=cwd).wait()


# print("Preallocated: Build \n")
# for skew in range(2,17):
# 	for i in range(0, 5): #run 5 times for each skew
# 		args = [program, str(amount), str(alphabetSize), str(skew), 'build', str(0)]
# 		subprocess.Popen(args, cwd=cwd).wait()
# 		args = [program, str(amount), str(alphabetSize), str(skew), 'build', str(1)]
# 		subprocess.Popen(args, cwd=cwd).wait()

print("\nNaiveInteger: Rank")
for skew in range(2,11):
	for i in range(0, 5): #run 5 times for each skew
		args = [program, str(amount), str(alphabetSize), str(skew), 'rank', str(0), outputFilename]
		subprocess.Popen(args, cwd=cwd).wait()
		args = [program, str(amount), str(alphabetSize), str(skew), 'rank', str(1), outputFilename]
		subprocess.Popen(args, cwd=cwd).wait()

addNewline()

print("\nNaiveInteger: Select")
for skew in range(2,11):
	for i in range(0, 5): #run 5 times for each skew
		args = [program, str(amount), str(alphabetSize), str(skew), 'select', str(0), outputFilename]
		subprocess.Popen(args, cwd=cwd).wait()
		args = [program, str(amount), str(alphabetSize), str(skew), 'select', str(1), outputFilename]
		subprocess.Popen(args, cwd=cwd).wait()

addNewline()
addNewline()
