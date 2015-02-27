#!/usr/bin/python3

import subprocess
import os.path
from time import sleep

amount = 7
skew = 2
program = "dist/Release/GNU-Linux-x86/naiveinteger"
cwd = 'Code/Simple/NaiveInteger'

# program = "dist/Release/GNU-Linux-x86/preallocated"
# cwd = 'Code/Simple/Preallocated'

subprocess.Popen(['make','CONF=Release', 'clean'], cwd=cwd).wait()
subprocess.Popen(['make','CONF=Release'], cwd=cwd).wait()

for alphabetSize in range(12,19):
	args = [program, str(amount), str(alphabetSize), str(skew), 'build', str(0)]
	subprocess.Popen(args, cwd=cwd).wait()
	args = [program, str(amount), str(alphabetSize), str(skew), 'build', str(1)]
	subprocess.Popen(args, cwd=cwd).wait()