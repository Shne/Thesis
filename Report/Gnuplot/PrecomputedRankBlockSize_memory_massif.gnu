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
plot '../Data/PrecomputedRankBlockSize_memory.data' using ($1/4096):($2/1048576) with linespoints title "Naive",\
	'../Data/PrecomputedRankBlockSize_memory.data' using ($1/4096):($4/1048576) with linespoints title "Preallocated",\
	'../Data/PrecomputedRankBlockSize_memory.data' using ($1/4096):($3/1048576) with linespoints title "UnalignedNaive",\
	'../Data/PrecomputedRankBlockSize_memory.data' using ($1/4096):($5/1048576) with linespoints title "UnalignedPreallocated",\
	'../Data/PrecomputedRankBlockSize_memory.data' using ($1/4096):($6/1048576) with linespoints title "NaiveInteger"
