#!/usr/bin/python3

import random #also seeds it with system time
import array
import numpy.random
import numpy

def generateData(powerAmount, alphabetSize):
	fileName = "Data/n"+str(powerAmount)+"_as"+str(alphabetSize)+".data"
	fd = open(fileName, "w")
	alphabet = [chr(i) for i in range(32,alphabetSize+32)]

	print("Generating data: 10^"+str(powerAmount)+" entries of alphabetsize: "+str(len(alphabet)))
	amount = pow(10, powerAmount)
	randomArr = [random.choice(alphabet) for _ in range(amount)]

	print(''.join(alphabet), file=fd)
	print(len(alphabet), file=fd)
	print(''.join(randomArr), file=fd)

def generateReadableData(powerAmount, alphabetSize):
	fileName = "Data/n"+str(powerAmount)+"_as"+str(alphabetSize)+".data"
	fd = open(fileName, "w")
	if alphabetSize > 25:
		raise Exception("Alphabet size too large")
	alphabet = [chr(i) for i in range(65,alphabetSize+65)]

	print("Generating data: 10^"+str(powerAmount)+" entries of alphabetsize: "+str(len(alphabet)))
	amount = pow(10, powerAmount)
	randomArr = [random.choice(alphabet) for _ in range(amount)]

	print(''.join(alphabet), file=fd)
	print(len(alphabet), file=fd)
	print(''.join(randomArr), file=fd)

def generateIntegerData(powerAmount, powerAlphabetSize):
	fileName = "Data/n"+str(powerAmount)+"_as"+str(powerAlphabetSize)+".data"
	fd = open(fileName, "wb")

	print("Generating data: 10^"+str(powerAmount)+" entries of alphabetsize: 2^"+str(powerAlphabetSize))
	amount = pow(10, powerAmount)
	alphabetSize = pow(2, powerAlphabetSize)

	randomArray = array.array('I')
	for _ in range(amount):
		randomArray.append(random.randrange(0, alphabetSize))
	randomArray.tofile(fd)


def remapAlphabetSymbols(randomArray, alphabetSize):
	alphabet = range(alphabetSize)
	randomPermutedAlphabet = random.sample(alphabet, alphabetSize)
	newRandomArray = randomArray
	for j in alphabet:
		for i in range(len(randomArray)):					
			if randomArray[i] == j:
				newRandomArray[i] = randomPermutedAlphabet[j]
	return newRandomArray



def generateZipfData(powerAmount, powerAlphabetSize, s):
	fileName = "Data/n"+str(powerAmount)+"_as"+str(powerAlphabetSize)+"_zipf_s" + str(s) + ".data"
	fd = open(fileName, "wb")

	print("Generating data: 10^"+str(powerAmount)+" entries of alphabetsize: 2^"+str(powerAlphabetSize))
	amount = pow(10, powerAmount)
	alphabetSize = pow(2, powerAlphabetSize)

	randomArray = array.array('I')
	for _ in range(amount):
		value = numpy.random.zipf(s)
		while value > alphabetSize:
			value = numpy.random.zipf(s)
		randomArray.append(value)
	remappedRandomArray = remapAlphabetSymbols(randomArray, alphabetSize)
	remappedRandomArray.tofile(fd)

# generateZipfData(2, 4)

for i in range(8,25):
	generateZipfData(2, i, 1.2)
	generateZipfData(8, i, 1.2)
