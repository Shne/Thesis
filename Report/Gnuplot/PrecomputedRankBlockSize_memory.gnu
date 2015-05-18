#!/usr/bin/gnuplot

set key top horizontal
set term epslatex size 3.2,2.5 color font "" 6
set border


set xlabel "Block Size (number of pages)"
set ylabel "Memory Usage (MB)"
set yrange [790:880]
set output 'PrecomputedRankBlockSize_Build_Memory.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Build.data' every ::2 using ($1/32768):($3/1024) with linespoints linetype 1 title "Naive",\
	'' every ::2 using ($1/32768):($3/1024):($6/1024) with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Build.data' every ::2 using ($1/32768):($3/1024) with linespoints linetype 3 title "Preallocated",\
	'' every ::2 using ($1/32768):($3/1024):($6/1024) with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Build.data' every ::2 using ($1/32768):($3/1024) with linespoints linetype 2 title "UnalignedNaive",\
	'' every ::2 using ($1/32768):($3/1024):($6/1024) with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Build.data' every ::2 using ($1/32768):($3/1024) with linespoints linetype 4 title "UnalignedPreallocated",\
	'' every ::2 using ($1/32768):($3/1024):($6/1024) with yerrorbars linetype 4 notitle,\
	'../Data/PrecomputedRankBlockSize_NaiveInteger_Build.data' every ::2 using ($1/32768):($3/1024) with linespoints linetype 5 title "SimpleNaive",\
	'' every ::2 using ($1/32768):($3/1024):($6/1024) with yerrorbars linetype 5 notitle,\
