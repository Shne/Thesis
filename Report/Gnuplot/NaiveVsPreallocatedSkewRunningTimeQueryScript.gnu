#!/usr/bin/gnuplot

set term epslatex color
set output 'naiveRankSkewRunningTime.tex'
set xlabel "Skew"
set ylabel "Wall Time (microsec)"
set key font 'sans,2'
set xrange [2:10]
set yrange [30000:100000]
set key right bottom;

# set termoption enhanced
# f1(x) = a*x+b;
# f2(x) = a*x+b;
# f3(x) = a*x+b;
# f4(x) = a*x+b;
# fit f1(x) 'Gnuplot/naiveRankSkewRunningTime.data' via a,b	
# fit f2(x) 'Gnuplot/naiveSelectSkewRunningTime.data' via a,b	
# fit f3(x) 'Gnuplot/preallocatedRankSkewRunningTime.data' via a,b	
# fit f4(x) 'Gnuplot/preallocatedSelectSkewRunningTime.data' via a,b	

# plot 'naiveRankSkewRunningTime.data' using (1.0):2:(0):1
plot 'Gnuplot/naiveRankSkewRunningTime.data' using 1:2 with linespoints title "NaiveRank", \
'Gnuplot/naiveSelectSkewRunningTime.data' using 1:2 with linespoints title "NaiveSelect", \
'Gnuplot/preallocatedRankSkewRunningTime.data' using 1:2 with linespoints title "PreallocatedRank", \
'Gnuplot/preallocatedSelectSkewRunningTime.data' using 1:2 with linespoints title "PreallocatedSelect"
