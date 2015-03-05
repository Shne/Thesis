#!/usr/bin/python3

import re

alphabetSizeList = []
skewArray = []
realCyclesArray = []
wallTimeArray = []
virtualCyclesArray = []
totalCyclesArray = []
l1TotalCacheMissesArray = []
branchExecutedList = []
branchMispredictionsArray = []
TLBArray = []
l2TotalCacheMissesArray = []
l3TotalCacheMissesArray = []
memSizeArray = []
memResidentArray = []
memHighWatermarkArray = []

def getData(input_, algorithm, test):
	inputFile = open(input_, "rt")

	match = "algorithm="+algorithm+"\ttest="+test+".*";

	alphabetSizeReg = re.compile(match+"alphabetSize=(?P<alphabetSize>\d+)")
	skewReg = re.compile(match+"skew=(?P<skew>\d+)")
	realCyclesReg = re.compile(match+"real_cycles=(?P<real_cycles>\d+)")
	wallTimeReg = re.compile(match+"wall_time=(?P<wall_time>\d+)")
	virtualCyclesReg = re.compile(match+"virt_cycles=(?P<virt_cycles>\d+)")
	totalCyclesReg = re.compile(match+"PAPI_TOT_CYC=(?P<PAPI_TOT_CYC>\d+)")
	l1TotalCacheMissesReg = re.compile(match+"PAPI_L1_TCM=(?P<PAPI_L1_TCM>\d+)")
	branchExecutedReg = re.compile(match+"PAPI_BR_CN=(?P<PAPI_BR_CN>\d+)")
	branchMispredictionsReg = re.compile(match+"PAPI_BR_MSP=(?P<PAPI_BR_MSP>\d+)")
	TLBReg = re.compile(match+"PAPI_TLB_DM=(?P<PAPI_TLB_DM>\d+)")
	l2TotalCacheMissesReg = re.compile(match+"PAPI_L2_TCM=(?P<PAPI_L2_TCM>\d+)")
	l3TotalCacheMissesReg = re.compile(match+"PAPI_L3_TCM=(?P<PAPI_L3_TCM>\d+)")
	memSizeReg = re.compile(match+"mem_size=(?P<mem_size>\d+)")
	memResidentReg = re.compile(match+"mem_resident=(?P<mem_resident>\d+)")
	memHighWatermarkReg = re.compile(match+"mem_highwatermark=(?P<mem_highwatermark>\d+)")

	reset()

	for line in inputFile:
		alphabetSize = alphabetSizeReg.search(line)
		skew = skewReg.search(line)
		realCycles = realCyclesReg.search(line)
		wallTime = wallTimeReg.search(line)
		virtualCycles = virtualCyclesReg.search(line)
		totalCycles = totalCyclesReg.search(line)
		l1TotalCacheMisses = l1TotalCacheMissesReg.search(line)
		branchExecuted = branchExecutedReg.search(line)
		branchMispredictions = branchMispredictionsReg.search(line)
		TLB = TLBReg.search(line)
		l2TotalCacheMisses = l2TotalCacheMissesReg.search(line)
		l3TotalCacheMisses = l3TotalCacheMissesReg.search(line)
		memSize = memSizeReg.search(line)
		memResident = memResidentReg.search(line)
		memHighWatermark = memHighWatermarkReg.search(line)

		if alphabetSize is not None:
			alphabetSizeList.append(int(alphabetSize.group('alphabetSize')))
		if skew is not None:
			skewArray.append(int(skew.group('skew')))
		if realCycles is not None:
			realCyclesArray.append(int(realCycles.group('real_cycles')))
		if wallTime is not None:
			wallTimeArray.append(int(wallTime.group('wall_time')))
		if virtualCycles is not None:
			virtualCyclesArray.append(int(virtualCycles.group('virt_cycles')))
		if totalCycles is not None:
			totalCyclesArray.append(int(totalCycles.group('PAPI_TOT_CYC')))
		if l1TotalCacheMisses is not None:
			l1TotalCacheMissesArray.append(int(l1TotalCacheMisses.group('PAPI_L1_TCM')))
		if branchExecuted is not None:
			branchExecutedList.append(int(branchExecuted.group('PAPI_BR_CN')))
		if branchMispredictions is not None:
			branchMispredictionsArray.append(int(branchMispredictions.group('PAPI_BR_MSP')))
		if TLB is not None:
			TLBArray.append(int(TLB.group('PAPI_TLB_DM')))
		if l2TotalCacheMisses is not None:
			l2TotalCacheMissesArray.append(int(l2TotalCacheMisses.group('PAPI_L2_TCM')))
		if l3TotalCacheMisses is not None:
			l3TotalCacheMissesArray.append(int(l3TotalCacheMisses.group('PAPI_L3_TCM')))
		if memSize is not None:
			memSizeArray.append(int(memSize.group('mem_size')))
		if memResident is not None:
			memResidentArray.append(int(memResident.group('mem_resident')))
		if memHighWatermark is not None:
			memHighWatermarkArray.append(int(memHighWatermark.group('mem_highwatermark')))

def reset():
	del skewArray[:]
	del realCyclesArray[:]
	del wallTimeArray[:]
	del virtualCyclesArray[:]
	del totalCyclesArray[:]
	del l1TotalCacheMissesArray[:]
	del branchMispredictionsArray[:]
	del TLBArray[:]
	del l2TotalCacheMissesArray[:]
	del l3TotalCacheMissesArray[:]
	del memSizeArray[:]
	del memResidentArray[:]
	del memHighWatermarkArray[:]

def getReadOutputLists(valueListKeys):
	valueLists = []
	for key in valueListKeys:
		if(key == "skewArray"):
			valueLists.append(skewArray)
		elif(key == "realCyclesArray"):
			valueLists.append(realCyclesArray)
		elif(key == "wallTimeArray"):
			valueLists.append(wallTimeArray)
		elif(key == "virtualCyclesArray"):
			valueLists.append(virtualCyclesArray)
		elif(key == "totalCyclesArray"):
			valueLists.append(totalCyclesArray)
		elif(key == "l1TotalCacheMissesArray"):
			valueLists.append(l1TotalCacheMissesArray)
		elif(key == "branchMispredictionsArray"):
			valueLists.append(branchMispredictionsArray)
		elif(key == "TLBArray"):
			valueLists.append(TLBArray)
		elif(key == "l2TotalCacheMissesArray"):
			valueLists.append(l2TotalCacheMissesArray)
		elif(key == "l3TotalCacheMissesArray"):
			valueLists.append(l3TotalCacheMissesArray)
		elif(key == "memSizeArray"):
			valueLists.append(memSizeArray)
		elif(key == "memResidentArray"):
			valueLists.append(memResidentArray)
		elif(key == "memHighWatermarkArray"):
			valueLists.append(memHighWatermarkArray)
	return valueLists
