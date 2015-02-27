#!/usr/bin/python3

import subprocess
import os.path
from time import sleep

amount = 7
skew = 2
program = "dist/Release/GNU-Linux-x86/naiveinteger"
cwd = 'Code/Simple/NaiveInteger'

subprocess.Popen(['make', 'clean'], cwd=cwd).wait()
subprocess.Popen(['make'], cwd=cwd).wait()

for alphabetSize in range(12,19):
	args = [program, str(amount), str(alphabetSize), str(skew), 'build']
	p = subprocess.Popen(args, cwd=cwd)
	p.wait()
	sleep(1)