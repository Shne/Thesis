#!/usr/bin/gnuplot

set term epslatex color
set output 'NaiveVsPreallocatedSkewQueryCacheMisses.tex'
set xlabel "Skew"
set ylabel "Cache Misses"
set key font 'sans,2'
# set xrange [2:10]
# set yrange [30000:100000]
set key left top;
	

# plot 'naiveRankSkewRunningTime.data' using (1.0):2:(0):1
plot 'Gnuplot/naiveRankSkewCacheMisses.data' using 1:2 with linespoints title "Naive L1", \
'Gnuplot/naiveRankSkewCacheMisses.data' using 1:3 with linespoints title "Naive L2", \
'Gnuplot/naiveRankSkewCacheMisses.data' using 1:4 with linespoints title "Naive L3", \
'Gnuplot/preallocatedRankSkewCacheMisses.data' using 1:2 with linespoints title "Preallocated L1", \
'Gnuplot/preallocatedRankSkewCacheMisses.data' using 1:3 with linespoints title "Preallocated L2", \
'Gnuplot/preallocatedRankSkewCacheMisses.data' using 1:4 with linespoints title "Preallocated L3", \

# plot 'Gnuplot/naiveSelectSkewCacheMisses.data' using 1:2 with linespoints title "NaiveSelect L1", \
# 'Gnuplot/naiveSelectSkewCacheMisses.data' using 1:3 with linespoints title "NaiveSelect L2", \
# 'Gnuplot/naiveSelectSkewCacheMisses.data' using 1:4 with linespoints title "NaiveSelect L3", \

# plot 'Gnuplot/preallocatedRankSkewCacheMisses.data' using 1:2 with linespoints title "PreallocatedRank L1", \
# 'Gnuplot/preallocatedRankSkewCacheMisses.data' using 1:3 with linespoints title "PreallocatedRank L2", \
# 'Gnuplot/preallocatedRankSkewCacheMisses.data' using 1:4 with linespoints title "PreallocatedRank L3", \

# plot 'Gnuplot/preallocatedSelectSkewCacheMisses.data' using 1:2 with linespoints title "PreallocatedSelect L1", \
# 'Gnuplot/preallocatedSelectSkewCacheMisses.data' using 1:3 with linespoints title "PreallocatedSelect L2", \
# 'Gnuplot/preallocatedSelectSkewCacheMisses.data' using 1:4 with linespoints title "PreallocatedSelect L3", \

