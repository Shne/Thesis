#!/usr/bin/gnuplot

set key top vertical
set term epslatex size 3.2,2.5 color font "" 6
set border

stats '../Data/PrecomputedRankBlockSize_memory.data' using 6 nooutput
naiveIntegerValue = STATS_min

# MEMORY
set xlabel "Block Size (number of page sizes)"
set ylabel "Memory Usage (MB)"
set y2label "Relative to NaiveInteger"
set xrange [0:2]
set yrange [710:725]
set ytics nomirror
set y2tics
set y2range [710/(naiveIntegerValue/1048576):725/(naiveIntegerValue/1048576)]
set output 'PrecomputedRankBlockSize_MemoryUsage.tex'
plot '../Data/PrecomputedRankBlockSize_memory.data' using ($1/4096):($2/1048576) with linespoints linetype 1 title "Naive",\
	'' every ::2 using ($1/4096):($2/1048576):($7/1048576) with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_memory.data' using ($1/4096):($4/1048576) with linespoints linetype 2 title "Preallocated",\
	'' every ::2 using ($1/4096):($4/1048576):($9/1048576) with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_memory.data' using ($1/4096):($3/1048576) with linespoints linetype 3 title "UnalignedNaive",\
	'' every ::2 using ($1/4096):($3/1048576):($8/1048576) with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_memory.data' using ($1/4096):($5/1048576) with linespoints linetype 4 title "UnalignedPreallocated",\
	'' every ::2 using ($1/4096):($5/1048576):($10/1048576) with yerrorbars linetype 4 notitle,\
	'../Data/PrecomputedRankBlockSize_memory.data' using ($1/4096):($6/1048576) with linespoints linetype 5 title "SimpleNaive",\
	'' every ::2 using ($1/4096):($6/1048576):($11/1048576) with yerrorbars linetype 5 notitle,\
