#!/usr/bin/gnuplot

set term epslatex size 5.6,3.3 color
set xlabel "Skew"
# set xrange [2:10]
# set yrange [30000:100000]

set yrange [0:*]
set xrange [2:*]
stats '../Data/naiveRankSkew.data' every ::::0 using 2 nooutput
stddevNaive = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemoryRankSkew.data' every ::::0 using 2 nooutput
stddevControlled = sprintf("%g",STATS_min)
set key right bottom;	
set ylabel "Cache Misses"
set output 'L1NaiveVsControlledNodeMemorySkewRankQueryCacheMisses.tex'
plot '../Data/naiveRankSkew.data' using 1:2 with linespoints title "Naive L1 $mr\\sigma=$".stddevNaive, \
'../Data/controlledNodeMemoryRankSkew.data' using 1:2 with linespoints title "ControlledNodeMemory L1 $mr\\sigma=$".stddevControlled, \


stats '../Data/naiveRankSkew.data' every ::::0 using 3 nooutput
stddevNaiveL2 = sprintf("%g",STATS_min)
stats '../Data/naiveRankSkew.data' every ::::0 using 4 nooutput
stddevNaiveL3 = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemoryRankSkew.data' every ::::0 using 3 nooutput
stddevControlledL2 = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemoryRankSkew.data' every ::::0 using 4 nooutput
stddevControlledL3 = sprintf("%g",STATS_min)
set key left top;
set output 'L2L3NaiveVsControlledNodeMemorySkewRankQueryCacheMisses.tex'
plot '../Data/naiveRankSkew.data' using 1:3 with linespoints title "Naive L2 $mr\\sigma=$".stddevNaiveL2, \
'../Data/naiveRankSkew.data' using 1:4 with linespoints title "Naive L3 $mr\\sigma=$".stddevNaiveL3, \
'../Data/controlledNodeMemoryRankSkew.data' using 1:3 with linespoints title "ControlledNodeMemory L2 $mr\\sigma=$".stddevControlledL2, \
'../Data/controlledNodeMemoryRankSkew.data' using 1:4 with linespoints title "ControlledNodeMemory L3 $mr\\sigma=$".stddevControlledL3, \

stats '../Data/naiveSelectSkew.data' every ::::0 using 2 nooutput
stddevNaiveL1 = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemorySelectSkew.data' every ::::0 using 2 nooutput
stddevControlledL1 = sprintf("%g",STATS_min)
set key right bottom;
set output 'L1NaiveVsControlledNodeMemorySkewSelectQueryCacheMisses.tex'
plot '../Data/naiveSelectSkew.data' using 1:2 with linespoints title "Naive L1 $mr\\sigma=$".stddevNaiveL1, \
'../Data/controlledNodeMemorySelectSkew.data' using 1:2 with linespoints title "ControlledNodeMemory L1 $mr\\sigma=$".stddevControlledL1, \

stats '../Data/naiveSelectSkew.data' every ::::0 using 3 nooutput
stddevNaiveL2 = sprintf("%g",STATS_min)
stats '../Data/naiveSelectSkew.data' every ::::0 using 4 nooutput
stddevNaiveL3 = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemorySelectSkew.data' every ::::0 using 3 nooutput
stddevControlledL2 = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemorySelectSkew.data' every ::::0 using 4 nooutput
stddevControlledL3 = sprintf("%g",STATS_min)
set output 'L2L3NaiveVsControlledNodeMemorySkewSelectQueryCacheMisses.tex'
plot '../Data/naiveSelectSkew.data' using 1:3 with linespoints title "Naive L2 $mr\\sigma=$".stddevNaiveL2, \
'../Data/naiveSelectSkew.data' using 1:4 with linespoints title "Naive L3 $mr\\sigma=$".stddevNaiveL3, \
'../Data/controlledNodeMemorySelectSkew.data' using 1:3 with linespoints title "ControlledNodeMemory L2 $mr\\sigma=$".stddevControlledL2, \
'../Data/controlledNodeMemorySelectSkew.data' using 1:4 with linespoints title "ControlledNodeMemory L3 $mr\\sigma=$".stddevControlledL3, \

stats '../Data/naiveRankSkew.data' every ::::0 using 6 nooutput
stddevNaiveTLB = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemoryRankSkew.data' every ::::0 using 6 nooutput
stddevControlledTLB = sprintf("%g",STATS_min)
set key left top;
set ylabel "TLB"
set output 'NaiveVsControlledNodeMemorySkewRankQueryTLB.tex'
plot '../Data/naiveRankSkew.data' using 1:6 with linespoints title "Naive $mr\\sigma=$".stddevNaiveTLB, \
'../Data/controlledNodeMemoryRankSkew.data' using 1:6 with linespoints title "ControlledNodeMemory $mr\\sigma=$".stddevControlledTLB, \

stats '../Data/naiveSelectSkew.data' every ::::0 using 6 nooutput
stddevNaiveTLB = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemorySelectSkew.data' every ::::0 using 6 nooutput
stddevControlledTLB = sprintf("%g",STATS_min)
set key right bottom;
set output 'NaiveVsControlledNodeMemorySkewSelectQueryTLB.tex'
plot '../Data/naiveSelectSkew.data' using 1:6 with linespoints title "Naive $mr\\sigma=$".stddevNaiveTLB, \
'../Data/controlledNodeMemorySelectSkew.data' using 1:6 with linespoints title "ControlledNodeMemory $mr\\sigma=$".stddevControlledTLB, \

stats '../Data/naiveRankSkew.data' every ::::0 using 10 nooutput
stddevNaiveBMrate = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemoryRankSkew.data' every ::::0 using 10 nooutput
stddevControlledBMrate = sprintf("%g",STATS_min)
set ylabel "Branch Misprediction Rate"
set output 'NaiveVsControlledNodeMemorySkewRankQuery_BMrate.tex'
plot '../Data/naiveRankSkew.data' using 1:10 with linespoints title "Naive $mr\\sigma=$".stddevNaiveBMrate, \
'../Data/controlledNodeMemoryRankSkew.data' using 1:10 with linespoints title "ControlledNodeMemory $mr\\sigma=$".stddevControlledBMrate, \

stats '../Data/naiveSelectSkew.data' every ::::0 using 10 nooutput
stddevNaiveBMrate = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemorySelectSkew.data' every ::::0 using 10 nooutput
stddevControlledBMrate = sprintf("%g",STATS_min)
set output 'NaiveVsControlledNodeMemorySkewSelectQuery_BMrate.tex'
plot '../Data/naiveSelectSkew.data' using 1:10 with linespoints title "Naive $mr\\sigma=$".stddevNaiveBMrate, \
'../Data/controlledNodeMemorySelectSkew.data' using 1:10 with linespoints title "ControlledNodeMemory $mr\\sigma=$".stddevControlledBMrate, \

stats '../Data/naiveRankSkew.data' every ::::0 using 11 nooutput
stddevNaiveCMrate = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemoryRankSkew.data' every ::::0 using 11 nooutput
stddevControlledCMrate = sprintf("%g",STATS_min)
set ylabel "L2 Cache miss rate"
set output 'NaiveVsControlledNodeMemorySkewRankQuery_L2_DCMrate.tex'
plot '../Data/naiveRankSkew.data' using 1:11 with linespoints title "Naive $mr\\sigma=$".stddevNaiveCMrate, \
'../Data/controlledNodeMemoryRankSkew.data' using 1:11 with linespoints title "ControlledNodeMemory $mr\\sigma=$".stddevControlledCMrate, \

stats '../Data/naiveSelectSkew.data' every ::::0 using 11 nooutput
stddevNaiveCMrate = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemorySelectSkew.data' every ::::0 using 11 nooutput
stddevControlledCMrate = sprintf("%g",STATS_min)
set output 'NaiveVsControlledNodeMemorySkewSelectQuery_L2_DCMrate.tex'
plot '../Data/naiveSelectSkew.data' using 1:($3/$11) with linespoints title "Naive $mr\\sigma=$".stddevNaiveCMrate, \
'../Data/controlledNodeMemorySelectSkew.data' using 1:($3/$11) with linespoints title "ControlledNodeMemory $mr\\sigma=$".stddevControlledCMrate, \

stats '../Data/naiveRankSkew.data' every ::::0 using 8 nooutput
stddevNaiveRankTime = sprintf("%g",STATS_min)
stats '../Data/naiveSelectSkew.data' every ::::0 using 8 nooutput
stddevNaiveSelectTime = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemoryRankSkew.data' every ::::0 using 8 nooutput
stddevControlledRankTime = sprintf("%g",STATS_min)
stats '../Data/controlledNodeMemorySelectSkew.data' every ::::0 using 8 nooutput
stddevControlledSelectTime = sprintf("%g",STATS_min)
set ylabel "Wall Time ($\\mu$sec), naive"
set yrange [0:280000]
set ytics nomirror
set y2tics
set y2label "Wall Time ($\\mu$sec), controlled"
set y2range [0:28e+5/10]
set output 'naiveRankSelectSkewRunningTime.tex'
plot '../Data/naiveRankSkew.data' using 1:8 with linespoints title "NaiveRank $mr\\sigma=$".stddevNaiveRankTime, \
'../Data/naiveSelectSkew.data' using 1:($8*10) with linespoints title "NaiveSelect $mr\\sigma=$".stddevNaiveSelectTime, \
'../Data/controlledNodeMemoryRankSkew.data' using 1:8 with linespoints title "ControlledNodeRank $mr\\sigma=$".stddevControlledRankTime, \
'../Data/controlledNodeMemorySelectSkew.data' using 1:($8*10) with linespoints title "ControlledNodeSelect $mr\\sigma=$".stddevControlledSelectTime, \
