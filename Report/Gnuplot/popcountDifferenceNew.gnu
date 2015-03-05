#!/usr/bin/gnuplot
set term epslatex color #font '\rmdefault,11'

set xtics ("CPU Cycles" 0, "Wall Time" 3, "BM" 6, "TLBM" 9, "L1 CM" 12, "L2 CM" 15, "L3 CM" 18) rotate by -30

set ytics auto

set boxwidth 1.0
set style fill solid

# set key font 'sans,2'

set output 'popcountRankNew.tex'
plot '../Data/popcountRankNew.data' every 3    using 1:2 title "Simple Binary Rank " with boxes ls 1,\
     '../Data/popcountRankNew.data' every 3::1 using 1:2 title "Binary Rank using Popcount" with boxes ls 2

set yrange [0:120]

set output 'popcountSelectNew.tex'
plot '../Data/popcountSelectNew.data' every 3    using 1:2 title "Simple Binary Select" with boxes ls 1,\
     '../Data/popcountSelectNew.data' every 3::1 using 1:2 title "Binary Select using Popcount" with boxes ls 2