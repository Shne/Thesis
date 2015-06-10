#!/usr/bin/gnuplot

set key top right vertical
set term epslatex size 2.8,2.5 color font "" 6
set border

set ylabel "Memory usage (MB)"
set xlabel "Blocksize (bits)"

set output 'CumulativeSumSkew_n8as16_build_memory.tex'
plot '../Data/CumulativeSumSkew_n8as16_build_memory.data' using 1:($2/1048576) with linespoints linetype 1 notitle,\
	'' every ::3 using 1:($2/1048576):3 with yerrorbars linetype 1 notitle