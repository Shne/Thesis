#!/usr/bin/gnuplot

set key top left horizontal
# set term epslatex size 6.5,4 color

set term epslatex size 3.2,2.5 color font "" 6
set border
# set logscale x 2

# WALL TIME
set xlabel "Skew Parameter"
set ylabel "Wall Time ($\\mu s$)"
set yrange [0:*]
set xrange [1.9:6.1]

set output 'CumulativeSumSkew_n8as16_Build.tex'
plot '../Data/CumulativeSumSkew_n8as16_Build.data' every ::2 using 1:2 with linespoints linetype 1 title "CumulativeSum",\
	'' every ::2 using 1:2:3 with yerrorbars linetype 1 notitle

set output 'CumulativeSumSkew_n8as16_Rank.tex'
plot '../Data/CumulativeSumSkew_n8as16_Rank.data' every ::2 using 1:2 with linespoints linetype 1 title "CumulativeSum",\
	'' every ::2 using 1:2:3 with yerrorbars linetype 1 notitle

set output 'CumulativeSumSkew_n8as16_Rank_L1CM.tex'
plot '../Data/CumulativeSumSkew_n8as16_Rank.data' every ::2 using 1:4 with linespoints linetype 1 title "CumulativeSum",\
	'' every ::2 using 1:4:5 with yerrorbars linetype 1 notitle

set output 'CumulativeSumSkew_n8as16_Select.tex'
plot '../Data/CumulativeSumSkew_n8as16_Select.data' every ::2 using 1:2 with linespoints linetype 1 title "CumulativeSum",\
	'' every ::2 using 1:2:3 with yerrorbars linetype 1 notitle
