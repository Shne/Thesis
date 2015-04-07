#!/usr/bin/gnuplot

set term epslatex size 5.2,3.1 color
set xlabel "Skew"
set yrange [0:*]
set key outside top horizontal;

#max
stats '../Data/naiveRankSkew.data' every ::::0 using 2 nooutput
stddevNaive = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemoryRankSkew.data' every ::::0 using 2 nooutput
stddevControlled = sprintf("%g",STATS_min)
#avg
stats '../Data/naiveRankSkew.data' every ::::1 using 2 nooutput
stddevNaive1 = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemoryRankSkew.data' every ::::1 using 2 nooutput
stddevControlled1 = sprintf("%g",STATS_min)

#set key right bottom;	
set ylabel "Cache Misses"
set output 'L1NaiveVsControlledNodeMemorySkewRankQueryCacheMisses.tex'
plot '../Data/naiveRankSkew.data' every ::2 using 1:2 with linespoints title "Naive L1 $mr\\hat{\\sigma}=$".stddevNaive." $avg\\hat{\\sigma}=$".stddevNaive1, \
'../Data/controlledNodeMemoryRankSkew.data' every ::2 using 1:2 with linespoints title "ControlledNodeMemory L1 $mr\\hat{\\sigma}=$".stddevControlled." $avg\\hat{\\sigma}=$".stddevControlled1, \

#Max
stats '../Data/naiveRankSkew.data' every ::::0 using 3 nooutput
stddevNaiveL2 = sprintf("%g",STATS_min)
stats '../Data/naiveRankSkew.data' every ::::0 using 4 nooutput
stddevNaiveL3 = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemoryRankSkew.data' every ::::0 using 3 nooutput
stddevControlledL2 = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemoryRankSkew.data' every ::::0 using 4 nooutput
stddevControlledL3 = sprintf("%g",STATS_min)
#Avg
stats '../Data/naiveRankSkew.data' every ::::1 using 3 nooutput
stddevNaiveL2_1 = sprintf("%g",STATS_min)
stats '../Data/naiveRankSkew.data' every ::::1 using 4 nooutput
stddevNaiveL3_1 = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemoryRankSkew.data' every ::::1 using 3 nooutput
stddevControlledL2_1 = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemoryRankSkew.data' every ::::1 using 4 nooutput
stddevControlledL3_1 = sprintf("%g",STATS_min)
#set key left top;
set output 'L2L3NaiveVsControlledNodeMemorySkewRankQueryCacheMisses.tex'
plot '../Data/naiveRankSkew.data' every ::2 using 1:3 with linespoints title "Naive L2 $mr\\hat{\\sigma}=$".stddevNaiveL2." $avg\\hat{\\sigma}=$".stddevNaiveL2_1, \
'../Data/naiveRankSkew.data' every ::2 using 1:4 with linespoints title "Naive L3 $mr\\hat{\\sigma}=$".stddevNaiveL3." $avg\\hat{\\sigma}=$".stddevNaiveL3_1, \
'../Data/controlledNodeMemoryRankSkew.data' every ::2 using 1:3 with linespoints title "ControlledNodeMemory L2 $mr\\hat{\\sigma}=$".stddevControlledL2." $avg\\hat{\\sigma}=$".stddevControlledL2_1, \
'../Data/controlledNodeMemoryRankSkew.data' every ::2 using 1:4 with linespoints title "ControlledNodeMemory L3 $mr\\hat{\\sigma}=$".stddevControlledL3." $avg\\hat{\\sigma}=$".stddevControlledL3_1, \

#Max
stats '../Data/naiveSelectSkew.data' every ::::0 using 2 nooutput
stddevNaiveL1 = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemorySelectSkew.data' every ::::0 using 2 nooutput
stddevControlledL1 = sprintf("%g",STATS_min)
#Avg
stats '../Data/naiveSelectSkew.data' every ::::1 using 2 nooutput
stddevNaiveL1_1 = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemorySelectSkew.data' every ::::1 using 2 nooutput
stddevControlledL1_1 = sprintf("%g",STATS_min)
#set key right bottom;
set output 'L1NaiveVsControlledNodeMemorySkewSelectQueryCacheMisses.tex'
plot '../Data/naiveSelectSkew.data' every ::2 using 1:2 with linespoints title "Naive L1 $mr\\hat{\\sigma}=$".stddevNaiveL1." $avg\\hat{\\sigma}=$".stddevNaiveL1_1, \
'../Data/controlledNodeMemorySelectSkew.data' every ::2 using 1:2 with linespoints title "ControlledNodeMemory L1 $mr\\hat{\\sigma}=$".stddevControlledL1." $avg\\hat{\\sigma}=$".stddevControlledL1_1, \

#Max
stats '../Data/naiveSelectSkew.data' every ::::0 using 3 nooutput
stddevNaiveL2 = sprintf("%g",STATS_min)
stats '../Data/naiveSelectSkew.data' every ::::0 using 4 nooutput
stddevNaiveL3 = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemorySelectSkew.data' every ::::0 using 3 nooutput
stddevControlledL2 = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemorySelectSkew.data' every ::::0 using 4 nooutput
stddevControlledL3 = sprintf("%g",STATS_min)
#Avg
stats '../Data/naiveSelectSkew.data' every ::::1 using 3 nooutput
stddevNaiveL2_1 = sprintf("%g",STATS_min)
stats '../Data/naiveSelectSkew.data' every ::::1 using 4 nooutput
stddevNaiveL3_1 = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemorySelectSkew.data' every ::::1 using 3 nooutput
stddevControlledL2_1 = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemorySelectSkew.data' every ::::1 using 4 nooutput
stddevControlledL3_1 = sprintf("%g",STATS_min)
set output 'L2L3NaiveVsControlledNodeMemorySkewSelectQueryCacheMisses.tex'
plot '../Data/naiveSelectSkew.data' every ::2 using 1:3 with linespoints title "Naive L2 $mr\\hat{\\sigma}=$".stddevNaiveL2." $avg\\hat{\\sigma}=$".stddevNaiveL2_1, \
'../Data/naiveSelectSkew.data' every ::2 using 1:4 with linespoints title "Naive L3 $mr\\hat{\\sigma}=$".stddevNaiveL3." $avg\\hat{\\sigma}=$".stddevNaiveL3_1, \
'../Data/controlledNodeMemorySelectSkew.data' every ::2 using 1:3 with linespoints title "ControlledNodeMemory L2 $mr\\hat{\\sigma}=$".stddevControlledL2." $avg\\hat{\\sigma}=$".stddevControlledL2_1, \
'../Data/controlledNodeMemorySelectSkew.data' every ::2 using 1:4 with linespoints title "ControlledNodeMemory L3 $mr\\hat{\\sigma}=$".stddevControlledL3." $avg\\hat{\\sigma}=$".stddevControlledL3_1, \

#max
stats '../Data/naiveRankSkew.data' every ::::0 using 6 nooutput
stddevNaiveTLB = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemoryRankSkew.data' every ::::0 using 6 nooutput
stddevControlledTLB = sprintf("%g",STATS_min)
#avg
stats '../Data/naiveRankSkew.data' every ::::1 using 6 nooutput
stddevNaiveTLB_1 = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemoryRankSkew.data' every ::::1 using 6 nooutput
stddevControlledTLB_1 = sprintf("%g",STATS_min)
#set key left top;
set ylabel "TLB"
set output 'NaiveVsControlledNodeMemorySkewRankQueryTLB.tex'
plot '../Data/naiveRankSkew.data' every ::2 using 1:6 with linespoints title "Naive $mr\\hat{\\sigma}=$".stddevNaiveTLB." $avg\\hat{\\sigma}=$".stddevNaiveTLB_1, \
'../Data/controlledNodeMemoryRankSkew.data' every ::2 using 1:6 with linespoints title "ControlledNodeMemory $mr\\hat{\\sigma}=$".stddevControlledTLB." $avg\\hat{\\sigma}=$".stddevControlledTLB_1, \

#max
stats '../Data/naiveSelectSkew.data' every ::::0 using 6 nooutput
stddevNaiveTLB = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemorySelectSkew.data' every ::::0 using 6 nooutput
stddevControlledTLB = sprintf("%g",STATS_min)
#avg
stats '../Data/naiveSelectSkew.data' every ::::1 using 6 nooutput
stddevNaiveTLB_1 = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemorySelectSkew.data' every ::::1 using 6 nooutput
stddevControlledTLB_1 = sprintf("%g",STATS_min)
#set key right bottom;
set output 'NaiveVsControlledNodeMemorySkewSelectQueryTLB.tex'
plot '../Data/naiveSelectSkew.data' every ::2 using 1:6 with linespoints title "Naive $mr\\hat{\\sigma}=$".stddevNaiveTLB." $avg\\hat{\\sigma}=$".stddevNaiveTLB_1, \
'../Data/controlledNodeMemorySelectSkew.data' every ::2 using 1:6 with linespoints title "ControlledNodeMemory $mr\\hat{\\sigma}=$".stddevControlledTLB." $avg\\hat{\\sigma}=$".stddevControlledTLB_1, \

#max
stats '../Data/naiveRankSkew.data' every ::::0 using 10 nooutput
stddevNaiveBMrate = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemoryRankSkew.data' every ::::0 using 10 nooutput
stddevControlledBMrate = sprintf("%g",STATS_min)
#avg
stats '../Data/naiveRankSkew.data' every ::::1 using 10 nooutput
stddevNaiveBMrate_1 = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemoryRankSkew.data' every ::::1 using 10 nooutput
stddevControlledBMrate_1 = sprintf("%g",STATS_min)
set ylabel "Branch Misprediction Rate"
set output 'NaiveVsControlledNodeMemorySkewRankQuery_BMrate.tex'
plot '../Data/naiveRankSkew.data' every ::2 using 1:10 with linespoints title "Naive $mr\\hat{\\sigma}=$".stddevNaiveBMrate." $avg\\hat{\\sigma}=$".stddevNaiveBMrate_1, \
'../Data/controlledNodeMemoryRankSkew.data' every ::2 using 1:10 with linespoints title "ControlledNodeMemory $mr\\hat{\\sigma}=$".stddevControlledBMrate." $avg\\hat{\\sigma}=$".stddevControlledBMrate_1, \

#max
stats '../Data/naiveSelectSkew.data' every ::::0 using 10 nooutput
stddevNaiveBMrate = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemorySelectSkew.data' every ::::0 using 10 nooutput
stddevControlledBMrate = sprintf("%g",STATS_min)
#avg
stats '../Data/naiveSelectSkew.data' every ::::1 using 10 nooutput
stddevNaiveBMrate_1 = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemorySelectSkew.data' every ::::1 using 10 nooutput
stddevControlledBMrate_1 = sprintf("%g",STATS_min)
set output 'NaiveVsControlledNodeMemorySkewSelectQuery_BMrate.tex'
plot '../Data/naiveSelectSkew.data' every ::2 using 1:10 with linespoints title "Naive $mr\\hat{\\sigma}=$".stddevNaiveBMrate." $avg\\hat{\\sigma}=$".stddevNaiveBMrate_1, \
'../Data/controlledNodeMemorySelectSkew.data' every ::2 using 1:10 with linespoints title "ControlledNodeMemory $mr\\hat{\\sigma}=$".stddevControlledBMrate." $avg\\hat{\\sigma}=$".stddevControlledBMrate_1, \

#max
stats '../Data/naiveRankSkew.data' every ::::0 using 11 nooutput
stddevNaiveCMrate = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemoryRankSkew.data' every ::::0 using 11 nooutput
stddevControlledCMrate = sprintf("%g",STATS_min)
#avg
stats '../Data/naiveRankSkew.data' every ::::1 using 11 nooutput
stddevNaiveCMrate_1 = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemoryRankSkew.data' every ::::1 using 11 nooutput
stddevControlledCMrate_1 = sprintf("%g",STATS_min)
set ylabel "L2 Cache miss rate"
set output 'NaiveVsControlledNodeMemorySkewRankQuery_L2_DCMrate.tex'
plot '../Data/naiveRankSkew.data' every ::2 using 1:11 with linespoints title "Naive $mr\\hat{\\sigma}=$".stddevNaiveCMrate." $avg\\hat{\\sigma}=$".stddevNaiveCMrate_1, \
'../Data/controlledNodeMemoryRankSkew.data' every ::2 using 1:11 with linespoints title "ControlledNodeMemory $mr\\hat{\\sigma}=$".stddevControlledCMrate." $avg\\hat{\\sigma}=$".stddevControlledCMrate_1, \

#max
stats '../Data/naiveSelectSkew.data' every ::::0 using 11 nooutput
stddevNaiveCMrate = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemorySelectSkew.data' every ::::0 using 11 nooutput
stddevControlledCMrate = sprintf("%g",STATS_min)
#avg
stats '../Data/naiveSelectSkew.data' every ::::1 using 11 nooutput
stddevNaiveCMrate_1 = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemorySelectSkew.data' every ::::1 using 11 nooutput
stddevControlledCMrate_1 = sprintf("%g",STATS_min)
set output 'NaiveVsControlledNodeMemorySkewSelectQuery_L2_DCMrate.tex'
plot '../Data/naiveSelectSkew.data' every ::2 using 1:($3/$11) with linespoints title "Naive $mr\\hat{\\sigma}=$".stddevNaiveCMrate." $avg\\hat{\\sigma}=$".stddevNaiveCMrate_1, \
'../Data/controlledNodeMemorySelectSkew.data' every ::2 using 1:($3/$11) with linespoints title "ControlledNodeMemory $mr\\hat{\\sigma}=$".stddevControlledCMrate." $avg\\hat{\\sigma}=$".stddevControlledCMrate_1, \

#max
stats '../Data/naiveRankSkew.data' every ::::0 using 8 nooutput
stddevNaiveRankTime = sprintf("%g",STATS_min)
stats '../Data/naiveSelectSkew.data' every ::::0 using 8 nooutput
stddevNaiveSelectTime = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemoryRankSkew.data' every ::::0 using 8 nooutput
stddevControlledRankTime = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemorySelectSkew.data' every ::::0 using 8 nooutput
stddevControlledSelectTime = sprintf("%g",STATS_min)
#avg
stats '../Data/naiveRankSkew.data' every ::::1 using 8 nooutput
stddevNaiveRankTime1 = sprintf("%g",STATS_min)
stats '../Data/naiveSelectSkew.data' every ::::1 using 8 nooutput
stddevNaiveSelectTime1 = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemoryRankSkew.data' every ::::1 using 8 nooutput
stddevControlledRankTime1 = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemorySelectSkew.data' every ::::1 using 8 nooutput
stddevControlledSelectTime1 = sprintf("%g",STATS_min)

set term epslatex size 5.4,4.3 color
set ylabel "Wall Time ($\\mu$sec), naive"
# set yrange [0:280000]
# set ytics nomirror
# set y2tics
# set y2label "Wall Time ($\\mu$sec), controlled"
# set y2range [0:280000/10]
set output 'naiveRankSelectSkewRunningTime.tex'
plot '../Data/naiveRankSkew.data' every ::2 using 1:8 with linespoints title "NaiveRank $mr\\hat{\\sigma}=$".stddevNaiveRankTime." $avg\\hat{\\sigma}=$".stddevNaiveRankTime1, \
'../Data/naiveSelectSkew.data' every ::2 using 1:8 with linespoints title "NaiveSelect $mr\\hat{\\sigma}=$".stddevNaiveSelectTime." $avg\\hat{\\sigma}=$".stddevNaiveSelectTime1, \
'../Data/controlledNodeMemoryRankSkew.data' every ::2 using 1:8 with linespoints title "ControlledNodeRank $mr\\hat{\\sigma}=$".stddevControlledRankTime." $avg\\hat{\\sigma}=$".stddevControlledRankTime1, \
'../Data/controlledNodeMemorySelectSkew.data' every ::2 using 1:8 with linespoints title "ControlledNodeSelect $mr\\hat{\\sigma}=$".stddevControlledSelectTime." $avg\\hat{\\sigma}=$".stddevControlledSelectTime1
