#!/usr/bin/python3
import array


def rank(character, position):	
	rank = 0;
	index = 1;
	for c in intArray:
		if character == c:
			rank = rank + 1
		if index == position: 
			break		
		index = index + 1
	return rank

def select(character, occourance):	
	occ = 0;
	pos = 0;
	for c in intArray:
		if character == c:
			occ = occ + 1
		if occourance == occ: 
			break
		pos = pos + 1
	return pos

powerAmount = 7
alphabetSize = 12

amount = pow(10, powerAmount)

fileName = "Data/n"+str(powerAmount)+"_as"+str(alphabetSize)+".data"
fileHandle = open(fileName, "rb")
intArray = array.array('I')
intArray.fromfile(fileHandle, amount)

symbol = 3;
#print(intArray)
rank = rank(symbol, amount)
print("rank: " + str(rank))
position = select(symbol, 2000)
print("select: " + str(position))
print(intArray[position])



