#!/usr/bin/gnuplot

set term epslatex size 3.2,2.5 color font "" 6
set xlabel "Skew"
set yrange [0:*]
set key top horizontal;


#set key right bottom;	
set ylabel "Cache Misses"
set output 'L1NaiveVsControlledNodeMemorySkewRankQueryCacheMisses.tex'
plot '../Data/naiveRankSkew.data' every ::2 using 1:2 with linespoints title "Naive L1",\
'../Data/controlledNodeMemoryRankSkew.data' every ::2 using 1:2 with linespoints title "ControlledNodeMemory L1",\


#set key left top;
set output 'L2L3NaiveVsControlledNodeMemorySkewRankQueryCacheMisses.tex'
plot '../Data/naiveRankSkew.data' every ::2 using 1:3 with linespoints title "Naive L2",\
'../Data/naiveRankSkew.data' every ::2 using 1:4 with linespoints title "Naive L3",\
'../Data/controlledNodeMemoryRankSkew.data' every ::2 using 1:3 with linespoints title "ControlledNodeMemory L2",\
'../Data/controlledNodeMemoryRankSkew.data' every ::2 using 1:4 with linespoints title "ControlledNodeMemory L3",\

#set key right bottom;
set output 'L1NaiveVsControlledNodeMemorySkewSelectQueryCacheMisses.tex'
plot '../Data/naiveSelectSkew.data' every ::2 using 1:2 with linespoints title "Naive L1",\
'../Data/controlledNodeMemorySelectSkew.data' every ::2 using 1:2 with linespoints title "ControlledNodeMemory L1",\

set output 'L2L3NaiveVsControlledNodeMemorySkewSelectQueryCacheMisses.tex'
plot '../Data/naiveSelectSkew.data' every ::2 using 1:3 with linespoints title "Naive L2",\
'../Data/naiveSelectSkew.data' every ::2 using 1:4 with linespoints title "Naive L3",\
'../Data/controlledNodeMemorySelectSkew.data' every ::2 using 1:3 with linespoints title "ControlledNodeMemory L2",\
'../Data/controlledNodeMemorySelectSkew.data' every ::2 using 1:4 with linespoints title "ControlledNodeMemory L3",\

#set key left top;
set ylabel "TLB"
set output 'NaiveVsControlledNodeMemorySkewRankQueryTLB.tex'
plot '../Data/naiveRankSkew.data' every ::2 using 1:6 with linespoints title "Naive",\
'../Data/controlledNodeMemoryRankSkew.data' every ::2 using 1:6 with linespoints title "ControlledNodeMemory",\

#set key right bottom;
set output 'NaiveVsControlledNodeMemorySkewSelectQueryTLB.tex'
plot '../Data/naiveSelectSkew.data' every ::2 using 1:6 with linespoints title "Naive",\
'../Data/controlledNodeMemorySelectSkew.data' every ::2 using 1:6 with linespoints title "ControlledNodeMemory",\

set ylabel "Branch Misprediction Rate"
set output 'NaiveVsControlledNodeMemorySkewRankQuery_BMrate.tex'
plot '../Data/naiveRankSkew.data' every ::2 using 1:10 with linespoints title "Naive",\
'../Data/controlledNodeMemoryRankSkew.data' every ::2 using 1:10 with linespoints title "ControlledNodeMemory",\

set output 'NaiveVsControlledNodeMemorySkewSelectQuery_BMrate.tex'
plot '../Data/naiveSelectSkew.data' every ::2 using 1:10 with linespoints title "Naive",\
'../Data/controlledNodeMemorySelectSkew.data' every ::2 using 1:10 with linespoints title "ControlledNodeMemory",\

set ylabel "L2 Cache miss rate"
set output 'NaiveVsControlledNodeMemorySkewRankQuery_L2_DCMrate.tex'
plot '../Data/naiveRankSkew.data' every ::2 using 1:11 with linespoints title "Naive",\
'../Data/controlledNodeMemoryRankSkew.data' every ::2 using 1:11 with linespoints title "ControlledNodeMemory",\

set output 'NaiveVsControlledNodeMemorySkewSelectQuery_L2_DCMrate.tex'
plot '../Data/naiveSelectSkew.data' every ::2 using 1:($3/$11) with linespoints title "Naive",\
'../Data/controlledNodeMemorySelectSkew.data' every ::2 using 1:($3/$11) with linespoints title "ControlledNodeMemory",\


set ylabel "Wall Time (sec)"
set output 'naiveRankSkewRunningTime.tex'
plot '../Data/naiveRankSkew.data' every ::2 using 1:($8/1000000) with linespoints title "NaiveRank",\
'../Data/controlledNodeMemoryRankSkew.data' every ::2 using 1:($8/1000000) with linespoints title "ControlledNodeRank",\

set output 'naiveSelectSkewRunningTime.tex'
plot '../Data/naiveSelectSkew.data' every ::2 using 1:($8/1000000) with linespoints title "NaiveSelect",\
'../Data/controlledNodeMemorySelectSkew.data' every ::2 using 1:($8/1000000) with linespoints title "ControlledNodeSelect",\