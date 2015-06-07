#!/usr/bin/gnuplot

set key top horizontal
set term epslatex size 3.2,2.5 color font "" 6
set border
	
set ylabel "Walltime"
set xlabel "Block size (bits)"
set yrange [0:*]


set output 'CumulativeSumBlockSizeWallTimeSelect.tex'
plot '../Data/CumulativeSumBlockSize_Select.data' using 1:2 with linespoints linetype 1 title "Select",\
	'' every ::3 using 1:2:3 with yerrorbars linetype 1 notitle

set output 'CumulativeSumBlockSizeWallTimeRank.tex'
plot '../Data/CumulativeSumBlockSize_Rank.data' using 1:2 with linespoints linetype 1 title "Rank",\
	'' every ::3 using 1:2:3 with yerrorbars linetype 1 notitle

set output 'CumulativeSumBlockSizeWallTimeBuild.tex'
plot '../Data/CumulativeSumBlockSize_Build.data' using 1:2 with linespoints linetype 1 title "Build",\
	'' every ::3 using 1:2:3 with yerrorbars linetype 1 notitle

set output 'CumulativeSumBlockSizeWallTimeSelectBranchless.tex'
plot '../Data/CumulativeSumBlockSize_SelectBranchless.data' using 1:2 with linespoints linetype 1 title "Select, Branchless",\
	'' every ::3 using 1:2:3 with yerrorbars linetype 1 notitle

set output 'CumulativeSumBlockSizeZoomedRank.tex'
plot '../Data/CumulativeSumBlockSize_ZoomedRank.data' using 1:2 with linespoints linetype 1 title "Rank",\
	'' every ::3 using 1:2:3 with yerrorbars linetype 1 notitle

