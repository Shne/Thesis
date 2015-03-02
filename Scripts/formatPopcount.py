#!/usr/bin/python3

import ReadOutput

RankGnuplotFile = open("Report/Gnuplot/popcountRankNew.data", "w")
SelectGnuplotFile = open("Report/Gnuplot/popcountSelectNew.data", "w")
ValuesFile = open("Report/valuesForPopcount.tex", "w")
testDataFile = 'Output/testPopcount.output'

def avg(list):
	return sum(list) / len(list)

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

# Gnuplotfile
for i in range(0,7):
	number = i*3
	RankGnuplotFile.write(str(number) + '\t' + '100' + '\n')
	RankGnuplotFile.write(str(number+1) + '\t' + str(printList[i]*100) + '\n')
	RankGnuplotFile.write(str(number+2) + '\t' + '\n')

# Values file
ValuesFile.write('\\begin{tabular}{|l|r|r|r|}\n')
ValuesFile.write('\\hline')
ValuesFile.write('\\textbf{Rank} & no \\texttt{popcount} & \\texttt{popcount} & Percent')



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
SelectCyclesPop = avg(ReadOutput.totalCyclesArray) / SelectCyclesNoPop
SelectWalltimePop = avg(ReadOutput.wallTimeArray) / SelectWalltimeNoPop
SelectBranchMisPop = avg(ReadOutput.branchMispredictionsArray) / SelectBranchMisNoPop
SelectTLBPop = avg(ReadOutput.TLBArray) / SelectTLBNoPop
Select1CMPop = avg(ReadOutput.l1TotalCacheMissesArray) / Select1CMNoPop
Select2CMPop = avg(ReadOutput.l2TotalCacheMissesArray) / Select2CMNoPop
Select3CMPop = avg(ReadOutput.l3TotalCacheMissesArray) / Select3CMNoPop

printList = [SelectCyclesPop, SelectWalltimePop, SelectBranchMisPop, SelectTLBPop, Select1CMPop, Select2CMPop, Select3CMPop]

for i in range(0,7):
	number = i*3
	SelectGnuplotFile.write(str(number) + '\t' + '100' + '\n')
	SelectGnuplotFile.write(str(number+1) + '\t' + str(printList[i]*100) + '\n')
	SelectGnuplotFile.write(str(number+2) + '\t' + '\n')