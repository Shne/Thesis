#!/usr/bin/gnuplot
set term epslatex color #font '\rmdefault,11'

set xtics ("CPU Cycles" 0.25, "Wall Time" 1.75, "Cache Miss" 3.25, "Branch Mispr." 4.90)

set ytics auto

set boxwidth 0.5
set style fill solid

set key font 'sans,2'

set logscale y

set output 'rankPopcountDifference.tex'
plot 'Gnuplot/rankPopcountDifference.data' every 2    using 1:2 title "Simple Binary Rank " with boxes ls 1,\
     'Gnuplot/rankPopcountDifference.data' every 2::1 using 1:2 title "Binary Rank using Popcount" with boxes ls 2

set output 'selectPopcountDifference.tex'
plot 'Gnuplot/selectPopcountDifference.data' every 2    using 1:2 title "Simple Binary Select" with boxes ls 1,\
     'Gnuplot/selectPopcountDifference.data' every 2::1 using 1:2 title "Binary Select using Popcount" with boxes ls 2