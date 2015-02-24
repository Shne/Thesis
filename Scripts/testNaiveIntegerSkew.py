#!/usr/bin/python3

import subprocess
import os.path
from time import sleep

amount = 8
alphabetSize = 12
program = "dist/Release/GNU-Linux-x86/naiveinteger"
cwd = 'Code/Simple/NaiveInteger'

for skew in range(2,17):
	args = [program, str(amount), str(alphabetSize), str(skew)]
	p = subprocess.Popen(args, cwd=cwd)
	p.wait()
	sleep(1)