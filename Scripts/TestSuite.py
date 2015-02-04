#!/usr/bin/python3

import subprocess
import os.path
from GenerateData import generateData
from itertools import cycle




def readOrGenerateData(filename, powerAmount, alphabetSize):
	if os.path.isfile(filename):
		return open(filename, "r")

	generateData(powerAmount, alphabetSize)
	return open(filename, "r")


def testSimpleWaveletConstruction(powerAmount, alphabetSize):
	fileName = "simpleConstruction_n"+str(powerAmount)+"_as"+str(alphabetSize)

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
