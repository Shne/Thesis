#!/usr/bin/python3

import random #also seeds it with system time

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

def generateIntegerData(powerAmount, alphabetSize):
	fileName = "Data/n"+str(powerAmount)+"_as"+str(alphabetSize)+".data"
	fd = open(fileName, "w")

	print("Generating data: 10^"+str(powerAmount)+" entries of alphabetsize: "+str(alphabetSize))
	amount = pow(10, powerAmount)

	randomArray = [str(random.randint(0, alphabetSize)) for _ in range(amount)]
	print(amount, file=fd)
	print(alphabetSize, file=fd)
	print(' '.join(randomArray), file=fd)

generateIntegerData(6, 1024)