#!/usr/bin/python3

import numpy
import ReadOutput

RankGnuplotFile = open("Report/Gnuplot/popcountRankNew.data", "w")
SelectGnuplotFile = open("Report/Gnuplot/popcountSelectNew.data", "w")
ValuesFile = open("Report/valuesForPopcount.tex", "w")
testDataFile = 'Output/testPopcount.output'

def avg(list):
	return sum(list) / len(list)

# def avg(list):
# 	return numpy.median(numpy.array(list))

# RANK
# NO POPCOUNT
ReadOutput.getData(testDataFile, "SimpleNaiveIntegerNoPopcount", "rank")
RankCyclesNoPop = avg(ReadOutput.totalCyclesArray)
RankWalltimeNoPop = avg(ReadOutput.wallTimeArray)
RankBranchMisNoPop = avg(ReadOutput.branchMispredictionsArray)
RankTLBNoPop = avg(ReadOutput.TLBArray)
Rank1CMNoPop = avg(ReadOutput.l1TotalCacheMissesArray)
Rank2CMNoPop = avg(ReadOutput.l2TotalCacheMissesArray)
Rank3CMNoPop = avg(ReadOutput.l3TotalCacheMissesArray)

# POPCOUNT
ReadOutput.getData(testDataFile, "SimpleNaiveInteger", "rank")
RankCyclesPop = avg(ReadOutput.totalCyclesArray)
RankWalltimePop = avg(ReadOutput.wallTimeArray)
RankBranchMisPop = avg(ReadOutput.branchMispredictionsArray)
RankTLBPop = avg(ReadOutput.TLBArray)
Rank1CMPop = avg(ReadOutput.l1TotalCacheMissesArray)
Rank2CMPop = avg(ReadOutput.l2TotalCacheMissesArray)
Rank3CMPop = avg(ReadOutput.l3TotalCacheMissesArray)

printList = [RankCyclesPop/RankCyclesNoPop, RankWalltimePop/RankWalltimeNoPop, RankBranchMisPop/RankBranchMisNoPop, RankTLBPop/RankTLBNoPop, Rank1CMPop/Rank1CMNoPop, Rank2CMPop/Rank2CMNoPop, Rank3CMPop/Rank3CMNoPop]
printList = [element*100 for element in printList]
# Gnuplotfile
for i in range(0,7):
	number = i*3
	RankGnuplotFile.write(str(number) + '\t' + '100' + '\n')
	RankGnuplotFile.write(str(number+1) + '\t' + str(printList[i]) + '\n')
	RankGnuplotFile.write(str(number+2) + '\t' + '\n')

value = "{:,.1f}"
percent = "{:.2f}"

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
ValuesFile.write('\\textbf{L3 CM} & '+value.format(Rank3CMNoPop)+' & '+value.format(Rank3CMPop)+' & '+percent.format(printList[6])+'\\% \\\\ \hline\n')
ValuesFile.write('\\end{tabular}\\\\[5pt]\n')

# CONTINUE HERE


# SELECT
ReadOutput.getData(testDataFile, "SimpleNaiveIntegerNoPopcount", "select")
SelectCyclesNoPop = avg(ReadOutput.totalCyclesArray)
SelectWalltimeNoPop = avg(ReadOutput.wallTimeArray)
SelectBranchMisNoPop = avg(ReadOutput.branchMispredictionsArray)
SelectTLBNoPop = avg(ReadOutput.TLBArray)
Select1CMNoPop = avg(ReadOutput.l1TotalCacheMissesArray)
Select2CMNoPop = avg(ReadOutput.l2TotalCacheMissesArray)
Select3CMNoPop = avg(ReadOutput.l3TotalCacheMissesArray)

ReadOutput.getData(testDataFile, "SimpleNaiveInteger", "select")
SelectCyclesPop = avg(ReadOutput.totalCyclesArray)
SelectWalltimePop = avg(ReadOutput.wallTimeArray)
SelectBranchMisPop = avg(ReadOutput.branchMispredictionsArray)
SelectTLBPop = avg(ReadOutput.TLBArray)
Select1CMPop = avg(ReadOutput.l1TotalCacheMissesArray)
Select2CMPop = avg(ReadOutput.l2TotalCacheMissesArray)
Select3CMPop = avg(ReadOutput.l3TotalCacheMissesArray)

printList = [SelectCyclesPop/SelectCyclesNoPop, SelectWalltimePop/SelectWalltimeNoPop, SelectBranchMisPop/SelectBranchMisNoPop, SelectTLBPop/SelectTLBNoPop, Select1CMPop/Select1CMNoPop, Select2CMPop/Select2CMNoPop, Select3CMPop/Select3CMNoPop]
printList = [element*100 for element in printList]

#gnuplot
for i in range(0,7):
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
ValuesFile.write('\\textbf{L3 CM} & '+value.format(Select3CMNoPop)+' & '+value.format(Select3CMPop)+' & '+percent.format(printList[6])+'\\% \\\\ \hline\n')
ValuesFile.write('\\end{tabular}\\\\[5pt]\n')
