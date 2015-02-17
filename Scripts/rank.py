#!/usr/bin/python3
import array


def rank(character, position):	
	rank = 0;
	index = 1;
	for c in stringArray:
		if character == c:
			rank = rank + 1
		if index == position: 
			break		
		index = index + 1
	return rank

def select(character, occourance):	
	occ = 0;
	pos = 1;
	for c in stringArray:
		if character == c:
			occ = occ + 1
		if occourance == occ: 
			break		
		pos = pos + 1
	return pos



powerAmount = 2
alphabetSize = 2

fileName = "Data/n"+str(powerAmount)+"_as"+str(alphabetSize)+".data"
fileHandle = open(fileName, "rb")
stringArray = array.array('I')
stringArray.fromfile(fileHandle, pow(10,powerAmount))

symbol = 2;
#print(stringArray)
position = rank(symbol, pow(10,powerAmount))
print("rank: " + str(position))
print("select: " + str(select(symbol, position)))



