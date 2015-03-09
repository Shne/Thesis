#!/usr/bin/gnuplot

set term epslatex color
set xlabel "Skew"
set key font 'sans,2'
# set xrange [2:10]
# set yrange [30000:100000]
set key left top;
	
set ylabel "Cache Misses"
set output 'L1NaiveVsPreallocatedSkewRankQueryCacheMisses.tex'
plot '../Data/naiveRankSkew.data' using 1:2 with linespoints title "Naive L1", \
'../Data/preallocatedRankSkew.data' using 1:2 with linespoints title "Preallocated L1", \

set output 'L2L3NaiveVsPreallocatedSkewRankQueryCacheMisses.tex'
plot '../Data/naiveRankSkew.data' using 1:3 with linespoints title "Naive L2", \
'../Data/naiveRankSkew.data' using 1:4 with linespoints title "Naive L3", \
'../Data/preallocatedRankSkew.data' using 1:3 with linespoints title "Preallocated L2", \
'../Data/preallocatedRankSkew.data' using 1:4 with linespoints title "Preallocated L3", \

set output 'L1NaiveVsPreallocatedSkewSelectQueryCacheMisses.tex'
plot '../Data/naiveSelectSkew.data' using 1:2 with linespoints title "Naive L1", \
'../Data/preallocatedSelectSkew.data' using 1:2 with linespoints title "Preallocated L1", \

set output 'L2L3NaiveVsPreallocatedSkewSelectQueryCacheMisses.tex'
plot '../Data/naiveSelectSkew.data' using 1:3 with linespoints title "Naive L2", \
'../Data/naiveSelectSkew.data' using 1:4 with linespoints title "Naive L3", \
'../Data/preallocatedSelectSkew.data' using 1:3 with linespoints title "Preallocated L2", \
'../Data/preallocatedSelectSkew.data' using 1:4 with linespoints title "Preallocated L3", \


set ylabel "Branch Mis-predictions"
set output 'NaiveVsPreallocatedSkewRankQueryBM.tex'
plot '../Data/naiveRankSkew.data' using 1:5 with linespoints title "Naive", \
'../Data/preallocatedRankSkew.data' using 1:5 with linespoints title "Preallocated", \

set output 'NaiveVsPreallocatedSkewSelectQueryBM.tex'
plot '../Data/naiveSelectSkew.data' using 1:5 with linespoints title "Naive", \
'../Data/preallocatedSelectSkew.data' using 1:5 with linespoints title "Preallocated", \

set ylabel "TLB"
set output 'NaiveVsPreallocatedSkewRankQueryTLB.tex'
plot '../Data/naiveRankSkew.data' using 1:6 with linespoints title "Naive", \
'../Data/preallocatedRankSkew.data' using 1:6 with linespoints title "Preallocated", \

set output 'NaiveVsPreallocatedSkewSelectQueryTLB.tex'
plot '../Data/naiveSelectSkew.data' using 1:6 with linespoints title "Naive", \
'../Data/preallocatedSelectSkew.data' using 1:6 with linespoints title "Preallocated", \


set ylabel "Branch mis-prediction rate"
set output 'NaiveVsPreallocatedSkewRankQuery_BR_CN.tex'
plot '../Data/naiveRankSkew.data' using 1:($5/$7) with linespoints title "Naive", \
'../Data/preallocatedRankSkew.data' using 1:($5/$7) with linespoints title "Preallocated", \

set output 'NaiveVsPreallocatedSkewSelectQuery_BR_CN.tex'
plot '../Data/naiveSelectSkew.data' using 1:($5/$7) with linespoints title "Naive", \
'../Data/preallocatedSelectSkew.data' using 1:($5/$7) with linespoints title "Preallocated", \

set ylabel "Wall Time (microsec)"
set output 'naiveRankSelectSkewRunningTime.tex'
plot '../Data/naiveRankSkew.data' using 1:8 with linespoints title "NaiveRank", \
'../Data/naiveSelectSkew.data' using 1:8 with linespoints title "NaiveSelect", \
'../Data/preallocatedRankSkew.data' using 1:8 with linespoints title "PreallocatedRank", \
'../Data/preallocatedSelectSkew.data' using 1:8 with linespoints title "PreallocatedSelect"
