#!/usr/bin/gnuplot

set key top horizontal
# set term epslatex size 6.5,4 color

set term epslatex size 3.2,2.5 color font "" 6
set border
set logscale x

# WALL TIME
set xlabel "Block Size (bits)"
set ylabel "Wall Time ($\\mu s$)"
set yrange [0:*]

set output 'PrecomputedRankBlockSizeVaryN_5_Rank_WallTime.tex'
set arrow 1 from 316,0 to 316,2500 nohead lc rgb 'blue'
plot '../Data/PrecomputedRankBlockSizeVaryN_5_Rank.data' every ::2 using 4:3 with linespoints linetype 1 title "UnalignedNaive",\
	'' every ::2 using 4:3:5 with yerrorbars linetype 1 notitle
unset arrow 1

set arrow 1 from 1000,0 to 1000,6000 nohead lc rgb 'blue'
set output 'PrecomputedRankBlockSizeVaryN_6_Rank_WallTime.tex'
plot '../Data/PrecomputedRankBlockSizeVaryN_6_Rank.data' every ::2 using 4:3 with linespoints linetype 1 title "UnalignedNaive",\
	'' every ::2 using 4:3:5 with yerrorbars linetype 1 notitle
unset arrow 1

set arrow 1 from 3162,0 to 3162,25000 nohead lc rgb 'blue'
set output 'PrecomputedRankBlockSizeVaryN_7_Rank_WallTime.tex'
plot '../Data/PrecomputedRankBlockSizeVaryN_7_Rank.data' every ::2 using 4:3 with linespoints linetype 1 title "UnalignedNaive",\
	'' every ::2 using 4:3:5 with yerrorbars linetype 1 notitle
unset arrow 1

set arrow 1 from 10000,0 to 10000,250000 nohead lc rgb 'blue'
set output 'PrecomputedRankBlockSizeVaryN_8_Rank_WallTime.tex'
plot '../Data/PrecomputedRankBlockSizeVaryN_8_Rank.data' every ::2 using 4:3 with linespoints linetype 1 title "UnalignedNaive",\
	'' every ::2 using 4:3:5 with yerrorbars linetype 1 notitle
unset arrow 1