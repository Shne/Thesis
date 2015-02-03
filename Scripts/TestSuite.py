#!/usr/bin/python3

import subprocess
import os.path
import random #also seeds it with system time

def generateData(fd, amount, alphabet=None):
	if alphabet is None:
		alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
	
	print("Generating data: "+str(amount)+" entries of alphabetsize: "+str(len(alphabet)))

	randomArr = [random.choice(alphabet) for x in range(amount)]

	print(''.join(alphabet), file=fd)
	print(len(alphabet), file=fd)
	print(''.join(randomArr), file=fd)


def readOrGenerateData(filename, amount, alphabet=None):
	if os.path.isfile(filename):
		return open(filename, "r")

	fd = open(filename, "w")
	generateData(fd, amount, alphabet)
	return fd

def testSimpleWaveletConstruction_fullAlphabet_1millItems():
	filename = "Data/fullAlphabet_1millItem.data"
	amount = 1000000
	alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']

	inputFd = readOrGenerateData(filename, amount, alphabet)
	outputFd = open("Data/testSimpleWaveletConstruction_fullAlphabet_1millItem.output", "w")

	print("testSimpleWaveletConstruction_fullAlphabet_1millItems")
	subprocess.call('./simplewaveletconstruction-release', stdin=inputFd, stdout=outputFd)

def testSimpleWaveletConstruction_fullAlphabet_10millItems():
	filename = "Data/fullAlphabet_10millItem.data"
	amount = 10000000
	alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']

	inputFd = readOrGenerateData(filename, amount, alphabet)
	outputFd = open("Data/testSimpleWaveletConstruction_fullAlphabet_10millItem.output", "w")

	print("testSimpleWaveletConstruction_fullAlphabet_10millItems")
	subprocess.call('./simplewaveletconstruction-release', stdin=inputFd, stdout=outputFd)

def testSimpleWaveletConstruction_fullAlphabet_100millItems():
	filename = "Data/fullAlphabet_100millItem.data"
	amount = 100000000
	alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']

	inputFd = readOrGenerateData(filename, amount, alphabet)
	outputFd = open("Data/testSimpleWaveletConstruction_fullAlphabet_100millItem.output", "w")

	print("testSimpleWaveletConstruction_fullAlphabet_100millItems")
	subprocess.call('./simplewaveletconstruction-release', stdin=inputFd, stdout=outputFd)



subprocess.call('./makeall.sh', stdout=subprocess.DEVNULL)
testSimpleWaveletConstruction_fullAlphabet_1millItems()
testSimpleWaveletConstruction_fullAlphabet_10millItems()