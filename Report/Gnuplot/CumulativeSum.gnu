#!/usr/bin/gnuplot
set key top horizontal
set term epslatex size 3.2,2.5 color font "" 6

# set ytics auto

set boxwidth 1.0
# set style fill solid
set style fill solid 1.00 border 0
set style histogram errorbars gap 1.0
set style data histogram
# set bars 2
unset xlabel

# set yrange [0:205]

set key top left vertical
set output 'CumulativeSumBuildWalltime.tex'
plot '../Data/CumulativeSum.data' every 9    using 0:2 title "UnalignedNaive" ls 1,\
     '../Data/CumulativeSum.data' every 9::3 using 0:2 title "CumulativeSum" ls 2

# set output 'popcountSelectNew.tex'
# plot '../Data/popcountSelectNew.data' every 3    using 1:2 title "Simple Binary Select" with boxes ls 1,\
#      '../Data/popcountSelectNew.data' every 3::1 using 1:2 title "Binary Select w/Popcount" with boxes ls 2