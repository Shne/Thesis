#!/usr/bin/gnuplot

set term epslatex color
set output 'naiveRankSelectSkewRunningTime.tex'
set xlabel "Skew"
set ylabel "Wall Time (microsec)"
set key font 'sans,2'
set yrange [30000:100000]
set key left top;

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
plot '../Data/naiveRankSkewRunningTime.data' using 1:2 with linespoints title "NaiveRank", \
'../Data/naiveSelectSkewRunningTime.data' using 1:2 with linespoints title "NaiveSelect", \
'../Data/preallocatedRankSkewRunningTime.data' using 1:2 with linespoints title "PreallocatedRank", \
'../Data/preallocatedSelectSkewRunningTime.data' using 1:2 with linespoints title "PreallocatedSelect"
