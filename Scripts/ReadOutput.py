#!/usr/bin/python3

import re

alphabetSizeList = []
blockSizeList = []
skewList = []
realCyclesList = []
wallTimeList = []
virtualCyclesList = []
totalCyclesList = []
l1DataCacheMissesList = []
branchExecutedList = []
branchMispredictionsList = []
TLBList = []
l2DataCacheMissesList = []
l3TotalCacheMissesList = []
l2DataCacheHitsList = []
memSizeList = []
memResidentList = []
memHighWatermarkList = []
branchMissRateList = []
l2CacheMissRateList = []

def getData(input_, algorithm, test):
	inputFile = open(input_, "rt")

	match = "algorithm="+algorithm+"\ttest="+test+"\t.*";

	alphabetSizeReg = re.compile(match+"alphabetSize=(?P<alphabetSize>\d+)")
	blockSizeReg = re.compile(match+"blockSize=(?P<blockSize>\d+)")
	skewReg = re.compile(match+"skew=(?P<skew>\d+(\.\d*)?)")
	realCyclesReg = re.compile(match+"real_cycles=(?P<real_cycles>\d+)")
	wallTimeReg = re.compile(match+"wall_time=(?P<wall_time>\d+)")
	virtualCyclesReg = re.compile(match+"virt_cycles=(?P<virt_cycles>\d+)")
	totalCyclesReg = re.compile(match+"PAPI_TOT_CYC=(?P<PAPI_TOT_CYC>\d+)")
	l1DataCacheMissesReg = re.compile(match+"PAPI_L1_DCM=(?P<PAPI_L1_DCM>\d+)")
	branchExecutedReg = re.compile(match+"PAPI_BR_CN=(?P<PAPI_BR_CN>\d+)")
	branchMispredictionsReg = re.compile(match+"PAPI_BR_MSP=(?P<PAPI_BR_MSP>\d+)")
	TLBReg = re.compile(match+"PAPI_TLB_DM=(?P<PAPI_TLB_DM>\d+)")
	l2DataCacheMissesReg = re.compile(match+"PAPI_L2_DCM=(?P<PAPI_L2_DCM>\d+)")
	l3TotalCacheMissesReg = re.compile(match+"PAPI_L3_TCM=(?P<PAPI_L3_TCM>\d+)")
	l2DataCacheHitsReg = re.compile(match+"PAPI_L2_DCH=(?P<PAPI_L2_DCH>\d+)")
	memSizeReg = re.compile(match+"mem_size=(?P<mem_size>\d+)")
	memResidentReg = re.compile(match+"mem_resident=(?P<mem_resident>\d+)")
	memHighWatermarkReg = re.compile(match+"mem_highwatermark=(?P<mem_highwatermark>\d+)")

	reset()

	for line in inputFile:
		alphabetSize = alphabetSizeReg.search(line)
		blockSize = blockSizeReg.search(line)
		skew = skewReg.search(line)
		realCycles = realCyclesReg.search(line)
		wallTime = wallTimeReg.search(line)
		virtualCycles = virtualCyclesReg.search(line)
		totalCycles = totalCyclesReg.search(line)
		l1DataCacheMisses = l1DataCacheMissesReg.search(line)
		branchExecuted = branchExecutedReg.search(line)
		branchMispredictions = branchMispredictionsReg.search(line)
		TLB = TLBReg.search(line)
		l2DataCacheMisses = l2DataCacheMissesReg.search(line)
		l3TotalCacheMisses = l3TotalCacheMissesReg.search(line)
		l2DataCacheHits = l2DataCacheHitsReg.search(line)
		memSize = memSizeReg.search(line)
		memResident = memResidentReg.search(line)
		memHighWatermark = memHighWatermarkReg.search(line)

		if alphabetSize is not None:
			alphabetSizeList.append(int(alphabetSize.group('alphabetSize')))
		if blockSize is not None:
			blockSizeList.append(int(blockSize.group('blockSize')))
		if skew is not None:
			skewList.append(float(skew.group('skew')))
		if realCycles is not None:
			realCyclesList.append(int(realCycles.group('real_cycles')))
		if wallTime is not None:
			wallTimeList.append(int(wallTime.group('wall_time')))
		if virtualCycles is not None:
			virtualCyclesList.append(int(virtualCycles.group('virt_cycles')))
		if totalCycles is not None:
			totalCyclesList.append(int(totalCycles.group('PAPI_TOT_CYC')))
		if l1DataCacheMisses is not None:
			l1DataCacheMissesList.append(int(l1DataCacheMisses.group('PAPI_L1_DCM')))
		if branchExecuted is not None:
			branchExecutedList.append(int(branchExecuted.group('PAPI_BR_CN')))
		if branchMispredictions is not None:
			branchMispredictionsList.append(int(branchMispredictions.group('PAPI_BR_MSP')))
		if TLB is not None:
			TLBList.append(int(TLB.group('PAPI_TLB_DM')))
		if l2DataCacheMisses is not None:
			l2DataCacheMissesList.append(int(l2DataCacheMisses.group('PAPI_L2_DCM')))
		if l3TotalCacheMisses is not None:
			l3TotalCacheMissesList.append(int(l3TotalCacheMisses.group('PAPI_L3_TCM')))
		if l2DataCacheHits is not None:
			l2DataCacheHitsList.append(int(l2DataCacheHits.group('PAPI_L2_DCH')))
		if memSize is not None:
			memSizeList.append(int(memSize.group('mem_size')))
		if memResident is not None:
			memResidentList.append(int(memResident.group('mem_resident')))
		if memHighWatermark is not None:
			memHighWatermarkList.append(int(memHighWatermark.group('mem_highwatermark')))

	inputFile.close()
	for i in range(0,len(branchExecutedList)):
		branchMissRateList.append([float(branchMispredictionsList[i])/branchExecutedList[i]])
		l2CacheMissRateList.append([float(l2DataCacheMissesList[i])/l2DataCacheHitsList[i]])

def reset():
	del alphabetSizeList[:]
	del blockSizeList[:]
	del skewList[:]
	del realCyclesList[:]
	del wallTimeList[:]
	del virtualCyclesList[:]
	del totalCyclesList[:]
	del l1DataCacheMissesList[:]
	del branchExecutedList[:]
	del branchMispredictionsList[:]
	del TLBList[:]
	del l2DataCacheMissesList[:]
	del l3TotalCacheMissesList[:]
	del l2DataCacheHitsList[:]
	del memSizeList[:]
	del memResidentList[:]
	del memHighWatermarkList[:]
	del branchMissRateList[:]
	del l2CacheMissRateList[:]

def getReadOutputLists(valueListKeys):
	valueLists = []
	for key in valueListKeys:
		if(key == "alphabetSizeList"):
			valueLists.append(alphabetSizeList)
		elif(key == "blockSizeList"):
			valueLists.append(blockSizeList)
		elif(key == "skewList"):
			valueLists.append(skewList)
		elif(key == "realCyclesList"):
			valueLists.append(realCyclesList)
		elif(key == "wallTimeList"):
			valueLists.append(wallTimeList)
		elif(key == "virtualCyclesList"):
			valueLists.append(virtualCyclesList)
		elif(key == "totalCyclesList"):
			valueLists.append(totalCyclesList)
		elif(key == "l1DataCacheMissesList"):
			valueLists.append(l1DataCacheMissesList)
		elif(key == "branchMispredictionsList"):
			valueLists.append(branchMispredictionsList)
		elif(key == "TLBList"):
			valueLists.append(TLBList)
		elif(key == "l2DataCacheMissesList"):
			valueLists.append(l2DataCacheMissesList)
		elif(key == "l3TotalCacheMissesList"):
			valueLists.append(l3TotalCacheMissesList)
		elif(key == "l2DataCacheHitsList"):
			valueLists.append(l2DataCacheHitsList)
		elif(key == "memSizeList"):
			valueLists.append(memSizeList)
		elif(key == "memResidentList"):
			valueLists.append(memResidentList)
		elif(key == "memHighWatermarkList"):
			valueLists.append(memHighWatermarkList)
		elif(key == "branchMissRateList"):
			valueLists.append(branchMissRateList)
		elif(key == "l2CacheMissRateList"):
			valueLists.append(l2CacheMissRateList)
		elif(key == "branchExecutedList"):
			valueLists.append(branchExecutedList)

	return valueLists
