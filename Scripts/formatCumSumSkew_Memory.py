#!/usr/bin/python3

import re
import subprocess
import numpy

testDataFileName = 'Output/CumulativeSumSkew_n8as16_build_memory.output'
testsPerSize = 5

def frange(x, y, jump):
	while x < y:
		yield x
		x += jump

def clampFloat(f):
	return "{0:.1f}".format(f)

def avg(list):
	return sum(list)/len(list)

def getTotalMemoryForSpecificTest(dataFile, algorithm, skew):
	values = []
	for line in dataFile:
		m = re.search('algorithm='+algorithm+' skew='+clampFloat(skew)+' heap=(?P<heap>\d+) extra=(?P<extra>\d+) stacks=(?P<stacks>\d+)', line)
		if m is not None:
			values.append(int(m.group('heap')) + int(m.group('extra')) + int(m.group('stacks')))
	dataFile.seek(0)
	avgValue = avg(values)
	err = numpy.std(values)
	return (avgValue, err)

skewRange = frange(2, 6.1, 0.2)

testDataFile = open(testDataFileName, 'r')


#CumulativeSum
gnuplotFile = open("Report/Gnuplot/Data/CumulativeSumSkew_n8as16_build_memory.data", "w")
gnuplotFile.write("#[skew]  [Memory]  [MemoryErr]\n")

for skew in skewRange:
	CumulativeSumMem, CumulativeSumErr = getTotalMemoryForSpecificTest(testDataFile, 'CumulativeSum', skew)
	gnuplotFile.write(
		str(skew)+" "+
		str(CumulativeSumMem)+" "+
		str(CumulativeSumErr)+
		"\n"
	)

gnuplotFile.close()

GnuScriptFileName = '../CumulativeSumSkew_n8as16_build_memory.gnu'
cwd = 'Report/Gnuplot/Graphs'
subprocess.Popen(['gnuplot', GnuScriptFileName], cwd=cwd).wait()
