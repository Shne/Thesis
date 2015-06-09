#!/usr/bin/gnuplot

set key top right vertical
set term epslatex size 2.8,2.5 color font "" 6
set border
	
set ylabel "Memory usage (MB)"
set xlabel "Blocksize (bits)"

set output 'CumulativeSumVsUnalignedNaiveBlockSizeBuildMemory.tex'
plot '../Data/CumulativeSum_build_blocksize_memory.data' using 1:($2/1048576) with linespoints linetype 1 title "CumulativeSum",\
	'' every ::3 using 1:($2/1048576):3 with yerrorbars linetype 1 notitle,\
	'../Data/UnalignedNaive_build_blocksize_memory.data' using 1:($2/1048576) with linespoints linetype 2 title "UnalignedNaive",\
	'' every ::3 using 1:($2/1048576):3 with yerrorbars linetype 2 notitle