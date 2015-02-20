#!/usr/bin/python3

import re

cleverRankFilename = "Output/naiveinteger_query_n8_as12_cleverBinaryRank.output"
dumbRankFilename = "Output/naiveinteger_query_n8_as12_dumbBinaryRank.output"
cleverSelectFilename = "Output/naiveinteger_query_n8_as12_cleverBinarySelect.output"
dumbSelectFilename = "Output/naiveinteger_query_n8_as12_dumbBinarySelect.output"

cleverRankFile = open(cleverRankFilename, "rt")
dumbRankFile = open(dumbRankFilename, "rt")
cleverSelectFile = open(cleverSelectFilename, "rt")
dumbSelectFile = open(dumbSelectFilename, "rt")

cleverRankCycles, cleverRankWTime, cleverRankCache, cleverRankBranch = [], [], [], []
dumbRankCycles, dumbRankWTime, dumbRankCache, dumbRankBranch = [], [], [], []
cleverSelectCycles, cleverSelectWTime, cleverSelectCache, cleverSelectBranch = [], [], [], []
dumbSelectCycles, dumbSelectWTime, dumbSelectCache, dumbSelectBranch = [], [], [], []


reg = re.compile("(?P<skew>\d+)\t(?P<rcycles>\d+)\t(?P<wtime>\d+)\t(?P<cycles>\d+)\t(?P<cache>\d+)\t(?P<branch>\d+)")
for line in cleverRankFile:
	m = reg.search(line)
	if m is not None:
		cleverRankCycles.append(	int(m.group('cycles'))	)
		cleverRankWTime.append(		int(m.group('wtime'))	)
		cleverRankCache.append(		int(m.group('cache'))	)
		cleverRankBranch.append(	int(m.group('branch'))	)

for line in dumbRankFile:
	m = reg.search(line)
	if m is not None:
		dumbRankCycles.append(		int(m.group('cycles'))	)
		dumbRankWTime.append(		int(m.group('wtime'))	)
		dumbRankCache.append(		int(m.group('cache'))	)
		dumbRankBranch.append(		int(m.group('branch'))	)

for line in cleverSelectFile:
	m = reg.search(line)
	if m is not None:
		cleverSelectCycles.append(	int(m.group('cycles'))	)
		cleverSelectWTime.append(	int(m.group('wtime'))	)
		cleverSelectCache.append(	int(m.group('cache'))	)
		cleverSelectBranch.append(	int(m.group('branch'))	)

for line in dumbSelectFile:
	m = reg.search(line)
	if m is not None:
		dumbSelectCycles.append(	int(m.group('cycles'))	)
		dumbSelectWTime.append(		int(m.group('wtime'))	)
		dumbSelectCache.append(		int(m.group('cache'))	)
		dumbSelectBranch.append(	int(m.group('branch'))	)


def avg(inputList):
	return sum(inputList) / len(inputList)

rankGnuplotFile = open("Report/Gnuplot/rankPopcountDifference.data", "w")
selectGnuplotFile = open("Report/Gnuplot/selectPopcountDifference.data", "w")

i = 0
rankGnuplotFile.write(str(i)+" "+str(avg(dumbRankCycles))+"\n")
i += 0.5
rankGnuplotFile.write(str(i)+" "+str(avg(cleverRankCycles))+"\n")
i += 1
rankGnuplotFile.write(str(i)+" "+str(avg(dumbRankWTime))+"\n")
i += 0.5
rankGnuplotFile.write(str(i)+" "+str(avg(cleverRankWTime))+"\n")
i += 1
rankGnuplotFile.write(str(i)+" "+str(avg(dumbRankCache))+"\n")
i += 0.5
rankGnuplotFile.write(str(i)+" "+str(avg(cleverRankCache))+"\n")
i += 1
rankGnuplotFile.write(str(i)+" "+str(avg(dumbRankBranch))+"\n")
i += 0.5
rankGnuplotFile.write(str(i)+" "+str(avg(cleverRankBranch))+"\n")

i=0
selectGnuplotFile.write(str(i)+" "+str(avg(dumbSelectCycles))+"\n")
i += 0.5
selectGnuplotFile.write(str(i)+" "+str(avg(cleverSelectCycles))+"\n")
i += 1
selectGnuplotFile.write(str(i)+" "+str(avg(dumbSelectWTime))+"\n")
i += 0.5
selectGnuplotFile.write(str(i)+" "+str(avg(cleverSelectWTime))+"\n")
i += 1
selectGnuplotFile.write(str(i)+" "+str(avg(dumbSelectCache))+"\n")
i += 0.5
selectGnuplotFile.write(str(i)+" "+str(avg(cleverSelectCache))+"\n")
i += 1
selectGnuplotFile.write(str(i)+" "+str(avg(dumbSelectBranch))+"\n")
i += 0.5
selectGnuplotFile.write(str(i)+" "+str(avg(cleverSelectBranch))+"\n")

