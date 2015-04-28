#!/usr/bin/python3

import numpy
import ReadOutput
import subprocess

RankGnuplotFile = open("Report/Gnuplot/Data/popcountRankNew.data", "w")
SelectGnuplotFile = open("Report/Gnuplot/Data/popcountSelectNew.data", "w")
ValuesFile = open("Report/valuesForPopcount.tex", "w")
testDataFile = 'Output/testPopcount.output'

def avg(list):
	return sum(list) / len(list)

# def median(list):
# 	return numpy.median(numpy.array(list))

# RANK
# NO POPCOUNT
ReadOutput.getData(testDataFile, "SimpleNaiveIntegerNoPopcount", "rank")
RankCyclesNoPop = avg(ReadOutput.totalCyclesList)
RankWalltimeNoPop = avg(ReadOutput.wallTimeList)
RankBranchMisNoPop = avg(ReadOutput.branchMispredictionsList)
RankTLBNoPop = avg(ReadOutput.TLBList)
Rank1CMNoPop = avg(ReadOutput.l1DataCacheMissesList)
Rank2CMNoPop = avg(ReadOutput.l2DataCacheMissesList)
Rank2CHitsNoPop = avg(ReadOutput.l2DataCacheHitsList)
Rank2CMRateNoPop = Rank2CMNoPop/Rank2CHitsNoPop
Rank3CMNoPop = avg(ReadOutput.l3TotalCacheMissesList)

# POPCOUNT
ReadOutput.getData(testDataFile, "SimpleNaiveInteger", "rank")
RankCyclesPop = avg(ReadOutput.totalCyclesList)
RankWalltimePop = avg(ReadOutput.wallTimeList)
RankBranchMisPop = avg(ReadOutput.branchMispredictionsList)
RankTLBPop = avg(ReadOutput.TLBList)
Rank1CMPop = avg(ReadOutput.l1DataCacheMissesList)
Rank2CMPop = avg(ReadOutput.l2DataCacheMissesList)
Rank2CHitsPop = avg(ReadOutput.l2DataCacheHitsList)
Rank2CMRatePop = Rank2CMPop/Rank2CHitsPop
Rank3CMPop = avg(ReadOutput.l3TotalCacheMissesList)

printList = [
	RankCyclesPop/RankCyclesNoPop, 
	RankWalltimePop/RankWalltimeNoPop, 
	RankBranchMisPop/RankBranchMisNoPop, 
	RankTLBPop/RankTLBNoPop, 
	Rank1CMPop/Rank1CMNoPop, 
	Rank2CMPop/Rank2CMNoPop,
	Rank2CHitsPop/Rank2CHitsNoPop,
	Rank2CMRatePop/Rank2CMRateNoPop,
	Rank3CMPop/Rank3CMNoPop
]
printList = [element*100 for element in printList]
# Gnuplotfile
for i in range(len(printList)):
	number = i*3
	RankGnuplotFile.write(str(number) + '\t' + '100' + '\n')
	RankGnuplotFile.write(str(number+1) + '\t' + str(printList[i]) + '\n')
	RankGnuplotFile.write(str(number+2) + '\t' + '\n')

value = "{:,.2f}"
percent = "{:.3f}"

# Values file
ValuesFile.write('\\begin{tabular}{|l|r|r|r|}\n')
ValuesFile.write('\\hline\n')
ValuesFile.write('\\textbf{Rank} & no \\texttt{popcount} & \\texttt{popcount} & Percent \\\\ \hline\n')
ValuesFile.write('\\textbf{CPU Cycles} & '+value.format(RankCyclesNoPop)+' & '+value.format(RankCyclesPop)+' & '+percent.format(printList[0])+'\\% \\\\ \hline\n')
ValuesFile.write('\\textbf{Wall Time} & '+value.format(RankWalltimeNoPop)+' & '+value.format(RankWalltimePop)+' & '+percent.format(printList[1])+'\\% \\\\ \hline\n')
ValuesFile.write('\\textbf{BM} & '+value.format(RankBranchMisNoPop)+' & '+value.format(RankBranchMisPop)+' & '+percent.format(printList[2])+'\\% \\\\ \hline\n')
ValuesFile.write('\\textbf{TLBM} & '+value.format(RankTLBNoPop)+' & '+value.format(RankTLBPop)+' & '+percent.format(printList[3])+'\\% \\\\ \hline\n')
ValuesFile.write('\\textbf{L1 CM} & '+value.format(Rank1CMNoPop)+' & '+value.format(Rank1CMPop)+' & '+percent.format(printList[4])+'\\% \\\\ \hline\n')
ValuesFile.write('\\textbf{L2 CM} & '+value.format(Rank2CMNoPop)+' & '+value.format(Rank2CMPop)+' & '+percent.format(printList[5])+'\\% \\\\ \hline\n')
ValuesFile.write('\\textbf{L2 CHits} & '+value.format(Rank2CHitsNoPop)+' & '+value.format(Rank2CHitsPop)+' & '+percent.format(printList[6])+'\\% \\\\ \hline\n')
ValuesFile.write('\\textbf{L2 CM Rate} & '+value.format(Rank2CMRateNoPop)+' & '+value.format(Rank2CMRatePop)+' & '+percent.format(printList[7])+'\\% \\\\ \hline\n')
ValuesFile.write('\\textbf{L3 CM} & '+value.format(Rank3CMNoPop)+' & '+value.format(Rank3CMPop)+' & '+percent.format(printList[8])+'\\% \\\\ \hline\n')
ValuesFile.write('\\end{tabular}\\\\[5pt]\n')


# SELECT
ReadOutput.getData(testDataFile, "SimpleNaiveIntegerNoPopcount", "select")
SelectCyclesNoPop = avg(ReadOutput.totalCyclesList)
SelectWalltimeNoPop = avg(ReadOutput.wallTimeList)
SelectBranchMisNoPop = avg(ReadOutput.branchMispredictionsList)
SelectTLBNoPop = avg(ReadOutput.TLBList)
Select1CMNoPop = avg(ReadOutput.l1DataCacheMissesList)
Select2CMNoPop = avg(ReadOutput.l2DataCacheMissesList)
Select2CHitsNoPop = avg(ReadOutput.l2DataCacheHitsList)
Select2CMRateNoPop = Select2CMNoPop/Select2CHitsNoPop
Select3CMNoPop = avg(ReadOutput.l3TotalCacheMissesList)

ReadOutput.getData(testDataFile, "SimpleNaiveInteger", "select")
SelectCyclesPop = avg(ReadOutput.totalCyclesList)
SelectWalltimePop = avg(ReadOutput.wallTimeList)
SelectBranchMisPop = avg(ReadOutput.branchMispredictionsList)
SelectTLBPop = avg(ReadOutput.TLBList)
Select1CMPop = avg(ReadOutput.l1DataCacheMissesList)
Select2CMPop = avg(ReadOutput.l2DataCacheMissesList)
Select2CHitsPop = avg(ReadOutput.l2DataCacheHitsList)
Select2CMRatePop = Select2CMPop/Select2CHitsPop
Select3CMPop = avg(ReadOutput.l3TotalCacheMissesList)

printList = [
	SelectCyclesPop/SelectCyclesNoPop, 
	SelectWalltimePop/SelectWalltimeNoPop, 
	SelectBranchMisPop/SelectBranchMisNoPop, 
	SelectTLBPop/SelectTLBNoPop, 
	Select1CMPop/Select1CMNoPop, 
	Select2CMPop/Select2CMNoPop, 
	Select2CHitsPop/Select2CHitsNoPop, 
	Select2CMRatePop/Select2CMRateNoPop,
	Select3CMPop/Select3CMNoPop
]
printList = [element*100 for element in printList]

#gnuplot
for i in range(len(printList)):
	number = i*3
	SelectGnuplotFile.write(str(number) + '\t' + '100' + '\n')
	SelectGnuplotFile.write(str(number+1) + '\t' + str(printList[i]) + '\n')
	SelectGnuplotFile.write(str(number+2) + '\t' + '\n')

# Values file
ValuesFile.write('\\begin{tabular}{|l|r|r|r|}\n')
ValuesFile.write('\\hline\n')
ValuesFile.write('\\textbf{Select} & no \\texttt{popcount} & \\texttt{popcount} & Percent \\\\ \hline\n')
ValuesFile.write('\\textbf{CPU Cycles} & '+value.format(SelectCyclesNoPop)+' & '+value.format(SelectCyclesPop)+' & '+percent.format(printList[0])+'\\% \\\\ \hline\n')
ValuesFile.write('\\textbf{Wall Time} & '+value.format(SelectWalltimeNoPop)+' & '+value.format(SelectWalltimePop)+' & '+percent.format(printList[1])+'\\% \\\\ \hline\n')
ValuesFile.write('\\textbf{BM} & '+value.format(SelectBranchMisNoPop)+' & '+value.format(SelectBranchMisPop)+' & '+percent.format(printList[2])+'\\% \\\\ \hline\n')
ValuesFile.write('\\textbf{TLBM} & '+value.format(SelectTLBNoPop)+' & '+value.format(SelectTLBPop)+' & '+percent.format(printList[3])+'\\% \\\\ \hline\n')
ValuesFile.write('\\textbf{L1 CM} & '+value.format(Select1CMNoPop)+' & '+value.format(Select1CMPop)+' & '+percent.format(printList[4])+'\\% \\\\ \hline\n')
ValuesFile.write('\\textbf{L2 CM} & '+value.format(Select2CMNoPop)+' & '+value.format(Select2CMPop)+' & '+percent.format(printList[5])+'\\% \\\\ \hline\n')
ValuesFile.write('\\textbf{L2 CM} & '+value.format(Select2CHitsNoPop)+' & '+value.format(Select2CHitsPop)+' & '+percent.format(printList[6])+'\\% \\\\ \hline\n')
ValuesFile.write('\\textbf{L2 CM Rate} & '+value.format(Select2CMRateNoPop)+' & '+value.format(Select2CMRatePop)+' & '+percent.format(printList[7])+'\\% \\\\ \hline\n')
ValuesFile.write('\\textbf{L3 CM} & '+value.format(Select3CMNoPop)+' & '+value.format(Select3CMPop)+' & '+percent.format(printList[8])+'\\% \\\\ \hline\n')
ValuesFile.write('\\end{tabular}\\\\[5pt]\n')


RankGnuplotFile.close()
SelectGnuplotFile.close()
ValuesFile.close()

GnuScriptFileName = '../popcountDifferenceNew.gnu'
cwd = 'Report/Gnuplot/Graphs'
subprocess.Popen(['gnuplot', GnuScriptFileName], cwd=cwd).wait()
