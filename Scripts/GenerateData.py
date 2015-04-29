#!/usr/bin/python3

import random #also seeds it with system time
import array
import numpy.random
import numpy
import csv
import time

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

def generateIntegerDataNotPower(powerAmount, alphabetSize):
	fileName = "Data/n"+str(powerAmount)+"_as"+str(alphabetSize)+".data"
	fd = open(fileName, "wb")

	print("Generating data: 10^"+str(powerAmount)+" entries of alphabetsize: "+str(alphabetSize))
	amount = pow(10, powerAmount)

	randomArray = array.array('I')
	for _ in range(amount):
		randomArray.append(random.randrange(0, alphabetSize))
	randomArray.tofile(fd)


def remapAlphabetSymbols(randomArray, alphabetSize):
	alphabet = range(alphabetSize)
	randomPermutedAlphabet = random.sample(alphabet, alphabetSize)
	newRandomArray = array.array('I')
	print("remapping started")
	for char in randomArray:
		try:
			newRandomArray.append(randomPermutedAlphabet[char-1])
		except IndexError:
			print(char-1)
	print("remapping ended")
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


def linarSearch(wordlist, randomvalue, permutedSymbolMapping):
	for i in range(1,len(wordlist)):
		if randomvalue >= wordlist[i-1] and randomvalue < wordlist[i]:
			return permutedSymbolMapping[i-1]

def remapDataFileSymbols(powerAmount, alphabetSize):
	fileName = "Data/n"+str(powerAmount)+"_as"+str(alphabetSize)+"_NonUniform.data"
	fd = open(fileName, "rb")
	randomArray = array.array('I')
	randomArray.fromfile(fd, pow(10, powerAmount))
	remappedRandomArray = remapAlphabetSymbols(randomArray, alphabetSize)
	fileName = "Data/n"+str(powerAmount)+"_as"+str(alphabetSize)+"_NonUniform_remapped.data"
	fd = open(fileName, "wb")
	remappedRandomArray.tofile(fd)



def generateNonUniformRealData(powerAmount):
	cumulativeValueList = []
	with open('NGSL-101-with-SFI.csv') as csvfile:
		wordReader = csv.DictReader(csvfile, delimiter=';')
		for row in wordReader:
			cumulativeValueList.append(float(row['Cumulative']))
	range_l = 0.0000000000000000
	range_r = cumulativeValueList[-1]

	amount = pow(10, powerAmount)
	alphabetSize = len(cumulativeValueList) #31241
	print("Generating non-uniform data: 10^"+str(powerAmount)+" entries of alphabetsize: "+str(alphabetSize))

	randomArray = array.array('I')
	cumulativeValueListPadded = [0] + cumulativeValueList
	permutedSymbolMapping = random.sample(cumulativeValueList, len(cumulativeValueList))
	for _ in range(amount):
		randomValue = random.uniform(range_l, range_r)
		randomArray.append(linarSearch(cumulativeValueListPadded, randomValue, permutedSymbolMapping))

	fileName = "Data/n"+str(powerAmount)+"_as"+str(alphabetSize)+"_NonUniform.data"
	fd = open(fileName, "wb")
	randomArray.tofile(fd)


start = time.time()
# generateNonUniformRealData(8)
generateIntegerDataNotPower(8,31241)
# remapDataFileSymbols(8, 31241)
elapsed = time.time()-start
print("time = " + str(elapsed))

# for i in range(8,25):
# 	generateZipfData(2, i, 1.2)
# 	generateZipfData(8, i, 1.2)
