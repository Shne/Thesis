#!/usr/bin/python3

import subprocess
import os.path
import random #also seeds it with system time
from itertools import cycle

def generateData(fd, powerAmount, alphabetSize):
	alphabet = [chr(i) for i in range(32,alphabetSize+32)]
	
	print("Generating data: 10^"+str(powerAmount)+" entries of alphabetsize: "+str(len(alphabet)))
	amount = pow(10, powerAmount)
	randomArr = [random.choice(alphabet) for _ in range(amount)]

	print(''.join(alphabet), file=fd)
	print(len(alphabet), file=fd)
	print(''.join(randomArr), file=fd)


def readOrGenerateData(filename, powerAmount, alphabetSize):
	if os.path.isfile(filename):
		return open(filename, "r")

	generateData(open(filename, "w"), powerAmount, alphabetSize)
	return open(filename, "r")


def testSimpleWaveletConstruction(powerAmount, alphabetSize):
	fileName = "simpleConstruction_n:"+str(powerAmount)+"_as:"+str(alphabetSize)

	dataFileName = "Data/"+fileName+".data"
	outputFileName = "Data/"+fileName+".output"

	inputFd = readOrGenerateData(dataFileName, powerAmount, alphabetSize)
	outputFd = open(outputFileName, "w")

	print("Testing 10^"+str(powerAmount)+" characters from alphabet size "+str(alphabetSize))
	subprocess.call('./simplewaveletconstruction-release', stdin=inputFd, stdout=outputFd)
	with open(outputFileName, "r") as f:
		for line in f:
			print(line, end='')


subprocess.call('./makeall.sh', stdout=subprocess.DEVNULL)
# testSimpleWaveletConstruction(7, 20)
# testSimpleWaveletConstruction(7, 30)
testSimpleWaveletConstruction(7, 1000)
