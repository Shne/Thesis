#!/usr/bin/gnuplot
set key top horizontal
set term epslatex size 3.2,2.5 color font "" 6

set xtics ("CPU Cycles" 0, "Wall Time" 3, "BM" 6, "TLBM" 9, "L1 CM" 12, "L2 CM" 15, "L2 CHits" 18, "L2 CM Rate" 21, "L3 CM" 24) rotate by -30

set ytics auto

set boxwidth 1.0
set style fill solid

set yrange [0:205]
set ylabel "Percent of Simple"

set key top left vertical
set output 'popcountRankNew.tex'
plot '../Data/popcountRankNew.data' every 3    using 1:2 title "Simple" with boxes ls 1,\
     '../Data/popcountRankNew.data' every 3::1 using 1:2 title "Using Popcount" with boxes ls 2

set output 'popcountSelectNew.tex'
plot '../Data/popcountSelectNew.data' every 3    using 1:2 title "Simple" with boxes ls 1,\
     '../Data/popcountSelectNew.data' every 3::1 using 1:2 title "Using Popcount" with boxes ls 2