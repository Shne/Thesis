#!/usr/bin/python3

import subprocess
import os.path
from time import sleep

amount = 8
alphabetSize = 12
program = "dist/Release/GNU-Linux-x86/naiveinteger"
cwd = 'Code/Simple/NaiveInteger'

subprocess.Popen(['make','CONF=Release', 'clean'], cwd=cwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=cwd).wait()

#print("Preallocated: Build \n")
# for skew in range(2,17):
# 	for i in range(0, 5): #run 5 times for each skew
# 		args = [program, str(amount), str(alphabetSize), str(skew), "build"]
# 		p = subprocess.Popen(args, cwd=cwd)
# 		p.wait()
# 		sleep(1)

print("\nNaiveInteger: Rank")
for skew in range(2,11):
	#for i in range(0, 5): #run 5 times for each skew
	args = [program, str(amount), str(alphabetSize), str(skew), "rank"]
	p = subprocess.Popen(args, cwd=cwd)
	p.wait()
	sleep(1)

print("\nNaiveInteger: Select")
for skew in range(2,11):
	#for i in range(0, 5): #run 5 times for each skew
	args = [program, str(amount), str(alphabetSize), str(skew), "select"]
	p = subprocess.Popen(args, cwd=cwd)
	p.wait()
	sleep(1)
