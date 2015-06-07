#!/usr/bin/gnuplot

set key top horizontal
set term epslatex size 3.2,2.5 color font "" 6
set border
	
set ylabel "Memory usage (MB)"
set xlabel "Blocksize (bits)"


set output 'CumulativeSumVsUnalignedNaiveBlockSizeBuildMemory.tex'
plot '../Data/CumulativeSum_build_blocksize_memory.data' using 1:2 with linespoints linetype 1 title "CumulativeSum",\
	'' every ::3 using 1:2:3 with yerrorbars linetype 1 notitle,\
plot '../Data/UnalignedNaive_build_blocksize_memory.data' using 1:2 with linespoints linetype 2 title "UnalignedNaive",\
	'' every ::3 using 1:2:3 with yerrorbars linetype 2 notitle