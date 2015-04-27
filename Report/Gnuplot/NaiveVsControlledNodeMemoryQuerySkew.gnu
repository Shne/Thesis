#!/usr/bin/gnuplot

set term epslatex size 3.2,2.5 color font "" 6
set xlabel "Skew"
set yrange [0:*]
set key top horizontal;


#set key right bottom;	
set ylabel "Cache Misses"
set output 'L1NaiveVsControlledNodeMemorySkewRankQueryCacheMisses.tex'
plot '../Data/naiveRankSkew.data' every ::2 using 1:2 with linespoints linetype 1 title "Naive L1",\
	'' every ::2 using 1:2:17 with yerrorbars linetype 1 notitle,\
	'../Data/controlledNodeMemoryRankSkew.data' every ::2 using 1:2 with linespoints linetype 2 title "ControlledNodeMemory L1",\
	'' every ::2 using 1:2:17 with yerrorbars linetype 2 notitle,\


#set key left top;
set output 'L2L3NaiveVsControlledNodeMemorySkewRankQueryCacheMisses.tex'
plot '../Data/naiveRankSkew.data' every ::2 using 1:3 with linespoints linetype 1 title "Naive L2",\
	'' every ::2 using 1:3:18 with yerrorbars linetype 1 notitle,\
	'../Data/naiveRankSkew.data' every ::2 using 1:4 with linespoints linetype 2 title "Naive L3",\
	'' every ::2 using 1:4:20 with yerrorbars linetype 2 notitle,\
	'../Data/controlledNodeMemoryRankSkew.data' every ::2 using 1:3 with linespoints linetype 3 title "ControlledNodeMemory L2",\
	'' every ::2 using 1:3:18 with yerrorbars linetype 3 notitle,\
	'../Data/controlledNodeMemoryRankSkew.data' every ::2 using 1:4 with linespoints linetype 4 title "ControlledNodeMemory L3",\
	'' every ::2 using 1:4:20 with yerrorbars linetype 4 notitle,\

#set key right bottom;
set output 'L1NaiveVsControlledNodeMemorySkewSelectQueryCacheMisses.tex'
plot '../Data/naiveSelectSkew.data' every ::2 using 1:2 with linespoints linetype 1 title "Naive L1",\
	'' every ::2 using 1:2:17 with yerrorbars linetype 1 notitle,\
	'../Data/controlledNodeMemorySelectSkew.data' every ::2 using 1:2 with linespoints linetype 2 title "ControlledNodeMemory L1",\
	'' every ::2 using 1:2:17 with yerrorbars linetype 2 notitle,\

set output 'L2L3NaiveVsControlledNodeMemorySkewSelectQueryCacheMisses.tex'
plot '../Data/naiveSelectSkew.data' every ::2 using 1:3 with linespoints linetype 1 title "Naive L2",\
	'' every ::2 using 1:3:18 with yerrorbars linetype 1 notitle,\
	'../Data/naiveSelectSkew.data' every ::2 using 1:4 with linespoints linetype 2 title "Naive L3",\
	'' every ::2 using 1:4:20 with yerrorbars linetype 2 notitle,\
	'../Data/controlledNodeMemorySelectSkew.data' every ::2 using 1:3 with linespoints linetype 3 title "ControlledNodeMemory L2",\
	'' every ::2 using 1:3:18 with yerrorbars linetype 3 notitle,\
	'../Data/controlledNodeMemorySelectSkew.data' every ::2 using 1:4 with linespoints linetype 4 title "ControlledNodeMemory L3",\
	'' every ::2 using 1:4:20 with yerrorbars linetype 4 notitle,\

#set key left top;
set ylabel "TLB"
set output 'NaiveVsControlledNodeMemorySkewRankQueryTLB.tex'
plot '../Data/naiveRankSkew.data' every ::2 using 1:6 with linespoints linetype 1 title "Naive",\
	'' every ::2 using 1:6:16 with yerrorbars linetype 1 notitle,\
	'../Data/controlledNodeMemoryRankSkew.data' every ::2 using 1:6 with linespoints linetype 2 title "ControlledNodeMemory",\
	'' every ::2 using 1:6:16 with yerrorbars linetype 2 notitle,\

#set key right bottom;
set output 'NaiveVsControlledNodeMemorySkewSelectQueryTLB.tex'
plot '../Data/naiveSelectSkew.data' every ::2 using 1:6 with linespoints linetype 1 title "Naive",\
	'' every ::2 using 1:6:16 with yerrorbars linetype 1 notitle,\
	'../Data/controlledNodeMemorySelectSkew.data' every ::2 using 1:6 with linespoints linetype 2 title "ControlledNodeMemory",\
	'' every ::2 using 1:6:16 with yerrorbars linetype 2 notitle,\

set ylabel "Branch Misprediction Rate"
set output 'NaiveVsControlledNodeMemorySkewRankQuery_BMrate.tex'
plot '../Data/naiveRankSkew.data' every ::2 using 1:10 with linespoints linetype 1 title "Naive",\
	'' every ::2 using 1:10:13 with yerrorbars linetype 1 notitle,\
	'../Data/controlledNodeMemoryRankSkew.data' every ::2 using 1:10 with linespoints linetype 2 title "ControlledNodeMemory",\
	'' every ::2 using 1:10:13 with yerrorbars linetype 2 notitle,\

set output 'NaiveVsControlledNodeMemorySkewSelectQuery_BMrate.tex'
plot '../Data/naiveSelectSkew.data' every ::2 using 1:10 with linespoints linetype 1 title "Naive",\
	'' every ::2 using 1:10:13 with yerrorbars linetype 1 notitle,\
	'../Data/controlledNodeMemorySelectSkew.data' every ::2 using 1:10 with linespoints linetype 2 title "ControlledNodeMemory",\
	'' every ::2 using 1:10:13 with yerrorbars linetype 2 notitle,\

set ylabel "L2 Cache miss rate"
set output 'NaiveVsControlledNodeMemorySkewRankQuery_L2_DCMrate.tex'
plot '../Data/naiveRankSkew.data' every ::2 using 1:($3/($3+$9)) with linespoints linetype 1 title "Naive",\
	'' every ::2 using 1:($3/($3+$9)):($18/($3+$9)) with yerrorbars linetype 1 notitle,\
	'../Data/controlledNodeMemoryRankSkew.data' every ::2 using 1:($3/($3+$9)) with linespoints linetype 2 title "ControlledNodeMemory",\
	'' every ::2 using 1:($3/($3+$9)):($18/($3+$9)) with yerrorbars linetype 2 notitle,\

set output 'NaiveVsControlledNodeMemorySkewSelectQuery_L2_DCMrate.tex'
plot '../Data/naiveSelectSkew.data' every ::2 using 1:($3/($3+$9)) with linespoints linetype 1 title "Naive",\
	'' every ::2 using 1:($3/($3+$9)):($18/($3+$9)) with yerrorbars linetype 1 notitle,\
	'../Data/controlledNodeMemorySelectSkew.data' every ::2 using 1:($3/($3+$9)) with linespoints linetype 2 title "ControlledNodeMemory",\
	'' every ::2 using 1:($3/($3+$9)):($18/($3+$9)) with yerrorbars linetype 2 notitle,\


set ylabel "Wall Time (sec)"
set output 'naiveRankSkewRunningTime.tex'
plot '../Data/naiveRankSkew.data' every ::2 using 1:($8/1000000) with linespoints linetype 1 title "NaiveRank",\
	'' every ::2 using 1:($8/1000000):($12/1000000) with yerrorbars linetype 1 notitle,\
	'../Data/controlledNodeMemoryRankSkew.data' every ::2 using 1:($8/1000000) with linespoints linetype 2 title "ControlledNodeRank",\
	'' every ::2 using 1:($8/1000000):($12/1000000) with yerrorbars linetype 2 notitle,\

set output 'naiveSelectSkewRunningTime.tex'
plot '../Data/naiveSelectSkew.data' every ::2 using 1:($8/1000000) with linespoints linetype 1 title "NaiveSelect",\
	'' every ::2 using 1:($8/1000000):($12/1000000) with yerrorbars linetype 1 notitle,\
	'../Data/controlledNodeMemorySelectSkew.data' every ::2 using 1:($8/1000000) with linespoints linetype 2 title "ControlledNodeSelect",\
	'' every ::2 using 1:($8/1000000):($12/1000000) with yerrorbars linetype 2 notitle,\