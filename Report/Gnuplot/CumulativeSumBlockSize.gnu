#!/usr/bin/gnuplot

set key top horizontal
set term epslatex size 3.2,2.5 color font "" 6
set border
	
set ylabel "Walltime ($\\mu s$)"
set xlabel "Block size (bits)"
set format x "$2^{%L}$"
set yrange [0:*]
set logscale x 2

set output 'CumulativeSumBlockSizeWallTimeSelect.tex'
plot '../Data/CumulativeSumBlockSize_Select.data' using 1:2 with linespoints linetype 1 title "CumulativeSum",\
	'' every ::3 using 1:2:3 with yerrorbars linetype 1 notitle


set output 'CumulativeSumBlockSizeWallTimeRank.tex'
set arrow 1 from 64,0 to 64,7000 nohead lc rgb 'blue'
plot '../Data/CumulativeSumBlockSize_Rank.data' using 1:2 with linespoints linetype 1 title "CumulativeSum",\
	'' every ::3 using 1:2:3 with yerrorbars linetype 1 notitle
unset arrow 1

set output 'CumulativeSumBlockSizeWallTimeSelectBranchless.tex'
plot '../Data/CumulativeSumBlockSize_SelectBranchless.data' using 1:2 with linespoints linetype 1 title "CumulativeSum",\
	'' every ::3 using 1:2:3 with yerrorbars linetype 1 notitle


set yrange [0:18]
set ylabel "Walltime (seconds)"
set output 'CumulativeSumBlockSizeWallTimeBuild.tex'
plot '../Data/CumulativeSumBlockSize_Build.data' using 1:($2/1000000) with linespoints linetype 1 title "CumulativeSum",\
	'' every ::3 using 1:($2/1000000):($3/1000000) with yerrorbars linetype 1 notitle,\
	'../Data/UnalignedNaivePrecomputedBlockSize_Build.data' using 1:($2/1000000) with linespoints linetype 2 title "UnalignedNaive",\
	'' every ::3 using 1:($2/1000000):($3/1000000) with yerrorbars linetype 2 notitle
