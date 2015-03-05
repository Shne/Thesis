#!/usr/bin/gnuplot

set term epslatex color
set xlabel "Skew"
set ylabel "Cache Misses"
set key font 'sans,2'
# set xrange [2:10]
# set yrange [30000:100000]
set key left top;
	

set output 'L1NaiveVsPreallocatedSkewRankQueryCacheMisses.tex'
plot '../Data/naiveRankSkewCacheMisses.data' using 1:2 with linespoints title "Naive L1", \
'../Data/preallocatedRankSkewCacheMisses.data' using 1:2 with linespoints title "Preallocated L1", \

set output 'L2L3NaiveVsPreallocatedSkewRankQueryCacheMisses.tex'
plot '../Data/naiveRankSkewCacheMisses.data' using 1:3 with linespoints title "Naive L2", \
'../Data/naiveRankSkewCacheMisses.data' using 1:4 with linespoints title "Naive L3", \
'../Data/preallocatedRankSkewCacheMisses.data' using 1:3 with linespoints title "Preallocated L2", \
'../Data/preallocatedRankSkewCacheMisses.data' using 1:4 with linespoints title "Preallocated L3", \

set output 'L1NaiveVsPreallocatedSkewSelectQueryCacheMisses.tex'
plot '../Data/naiveSelectSkewCacheMisses.data' using 1:2 with linespoints title "Naive L1", \
'../Data/preallocatedSelectSkewCacheMisses.data' using 1:2 with linespoints title "Preallocated L1", \

set output 'L2L3NaiveVsPreallocatedSkewSelectQueryCacheMisses.tex'
plot '../Data/naiveSelectSkewCacheMisses.data' using 1:3 with linespoints title "Naive L2", \
'../Data/naiveSelectSkewCacheMisses.data' using 1:4 with linespoints title "Naive L3", \
'../Data/preallocatedSelectSkewCacheMisses.data' using 1:3 with linespoints title "Preallocated L2", \
'../Data/preallocatedSelectSkewCacheMisses.data' using 1:4 with linespoints title "Preallocated L3", \

