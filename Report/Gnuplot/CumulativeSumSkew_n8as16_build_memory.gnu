#!/usr/bin/gnuplot

set key top right vertical
set term epslatex size 3.2,2.5 color font "" 6
set border

set ylabel "Memory usage (MB)"
set xlabel "Blocksize (bits)"

set yrange [0:*]
set xrange [1.9:6.1]
set output 'CumulativeSumSkew_n8as16_build_memory.tex'
plot '../Data/CumulativeSumSkew_n8as16_build_memory.data' using 1:($2/1048576) with linespoints linetype 1 notitle,\
	'' every ::3 using 1:($2/1048576):3 with yerrorbars linetype 1 notitle