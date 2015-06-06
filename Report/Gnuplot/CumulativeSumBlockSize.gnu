#!/usr/bin/gnuplot

set key top horizontal
set term epslatex size 3.2,2.5 color font "" 6
set border
	
set ylabel "Walltime"
set xlabel "Blocksize (bit)"


set output 'CumulativeSumBlockSizeWallTimeSelect.tex'
plot '../Data/CumulativeSumBlockSize_Select.data' using 1:2 with linespoints linetype 1 title "Select",\
	'' every ::3 using 1:2:3 with yerrorbars linetype 1 notitle

set output 'CumulativeSumBlockSizeWallTimeRank.tex'
plot '../Data/CumulativeSumBlockSize_Rank.data' using 1:2 with linespoints linetype 1 title "Rank",\
	'' every ::3 using 1:2:3 with yerrorbars linetype 1 notitle