#!/usr/bin/gnuplot

set term epslatex size 5.6,3.3 color
set xlabel "Skew"
# set xrange [2:10]
# set yrange [30000:100000]

set yrange [0:*]

set key right bottom;	
set ylabel "Cache Misses"
set output 'L1NaiveVsControlledNodeMemorySkewRankQueryCacheMisses.tex'
plot '../Data/naiveRankSkew.data' using 1:2 with linespoints title "Naive L1", \
'../Data/controlledNodeMemoryRankSkew.data' using 1:2 with linespoints title "ControlledNodeMemory L1"

set key left top;
set output 'L2L3NaiveVsControlledNodeMemorySkewRankQueryCacheMisses.tex'
plot '../Data/naiveRankSkew.data' using 1:3 with linespoints title "Naive L2", \
'../Data/naiveRankSkew.data' using 1:4 with linespoints title "Naive L3", \
'../Data/controlledNodeMemoryRankSkew.data' using 1:3 with linespoints title "ControlledNodeMemory L2", \
'../Data/controlledNodeMemoryRankSkew.data' using 1:4 with linespoints title "ControlledNodeMemory L3"

set key right bottom;
set output 'L1NaiveVsControlledNodeMemorySkewSelectQueryCacheMisses.tex'
plot '../Data/naiveSelectSkew.data' using 1:2 with linespoints title "Naive L1", \
'../Data/controlledNodeMemorySelectSkew.data' using 1:2 with linespoints title "ControlledNodeMemory L1"

set output 'L2L3NaiveVsControlledNodeMemorySkewSelectQueryCacheMisses.tex'
plot '../Data/naiveSelectSkew.data' using 1:3 with linespoints title "Naive L2", \
'../Data/naiveSelectSkew.data' using 1:4 with linespoints title "Naive L3", \
'../Data/controlledNodeMemorySelectSkew.data' using 1:3 with linespoints title "ControlledNodeMemory L2", \
'../Data/controlledNodeMemorySelectSkew.data' using 1:4 with linespoints title "ControlledNodeMemory L3"

# set ylabel "Branch Mis-predictions"
# set output 'NaiveVsControlledNodeMemorySkewRankQueryBM.tex'
# plot '../Data/naiveRankSkew.data' using 1:5 with linespoints title "Naive", \
# '../Data/controlledNodeMemoryRankSkew.data' using 1:5 with linespoints title "ControlledNodeMemory"

# set output 'NaiveVsControlledNodeMemorySkewSelectQueryBM.tex'
# plot '../Data/naiveSelectSkew.data' using 1:5 with linespoints title "Naive", \
# '../Data/controlledNodeMemorySelectSkew.data' using 1:5 with linespoints title "ControlledNodeMemory"

set key left top;
set ylabel "TLB"
set output 'NaiveVsControlledNodeMemorySkewRankQueryTLB.tex'
plot '../Data/naiveRankSkew.data' using 1:6 with linespoints title "Naive", \
'../Data/controlledNodeMemoryRankSkew.data' using 1:6 with linespoints title "ControlledNodeMemory"

set key right bottom;
set output 'NaiveVsControlledNodeMemorySkewSelectQueryTLB.tex'
plot '../Data/naiveSelectSkew.data' using 1:6 with linespoints title "Naive", \
'../Data/controlledNodeMemorySelectSkew.data' using 1:6 with linespoints title "ControlledNodeMemory"

set ylabel "Branch Misprediction Rate"
set output 'NaiveVsControlledNodeMemorySkewRankQuery_BMrate.tex'
plot '../Data/naiveRankSkew.data' using 1:($5/$7) with linespoints title "Naive", \
'../Data/controlledNodeMemoryRankSkew.data' using 1:($5/$7) with linespoints title "ControlledNodeMemory"

set output 'NaiveVsControlledNodeMemorySkewSelectQuery_BMrate.tex'
plot '../Data/naiveSelectSkew.data' using 1:($5/$7) with linespoints title "Naive", \
'../Data/controlledNodeMemorySelectSkew.data' using 1:($5/$7) with linespoints title "ControlledNodeMemory"

set ylabel "L2 Cache miss rate"
set output 'NaiveVsControlledNodeMemorySkewRankQuery_L2_DCMrate.tex'
plot '../Data/naiveRankSkew.data' using 1:($3/$8) with linespoints title "Naive", \
'../Data/controlledNodeMemoryRankSkew.data' using 1:($3/$8) with linespoints title "ControlledNodeMemory"

set output 'NaiveVsControlledNodeMemorySkewSelectQuery_L2_DCMrate.tex'
plot '../Data/naiveSelectSkew.data' using 1:($3/$8) with linespoints title "Naive", \
'../Data/controlledNodeMemorySelectSkew.data' using 1:($3/$8) with linespoints title "ControlledNodeMemory"

set ylabel "Wall Time ($\\mu$sec), naive"
set yrange [0:280000]
set ytics nomirror
set y2tics
set y2label "Wall Time ($\\mu$sec), controlled"
set y2range [0:28e+5/10]
set output 'naiveRankSelectSkewRunningTime.tex'
plot '../Data/naiveRankSkew.data' using 1:8 with linespoints title "NaiveRank", \
'../Data/naiveSelectSkew.data' using 1:($8*10) with linespoints title "NaiveSelect", \
'../Data/controlledNodeMemoryRankSkew.data' using 1:8 with linespoints title "ControlledNodeRank", \
'../Data/controlledNodeMemorySelectSkew.data' using 1:($8*10) with linespoints title "ControlledNodeSelect"
