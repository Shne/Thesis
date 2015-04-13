#!/usr/bin/gnuplot

set key outside top horizontal
set term epslatex size 5.2,3.1 color
set border

stats '../Data/PrecomputedRankBlockSize_memory.data' using 2 nooutput
naiveIntegerValue = STATS_min

# MEMORY
set xlabel "Block Size (number of page sizes)"
set ylabel "Memory Usage (MB)"
set y2label "Relative to NaiveInteger"
set xrange [0:4]
set yrange [710:720]
set ytics nomirror
set y2tics
set y2range [710/(naiveIntegerValue/1048576):720/(naiveIntegerValue/1048576)]
set output 'PrecomputedRankBlockSize_MemoryUsage.tex'
plot '../Data/PrecomputedRankBlockSize_memory.data' using ($1/4096):($2/1048576) with linespoints title "NaiveInteger", \
	'../Data/PrecomputedRankBlockSize_memory.data' using ($1/4096):($3/1048576) with linespoints title "PreallocatedPrecomputed",\
	'../Data/PrecomputedRankBlockSize_memory.data' using ($1/4096):($4/1048576) with linespoints title "NaivePrecomputed",\
	'../Data/PrecomputedRankBlockSize_memory.data' using ($1/4096):($5/1048576) with linespoints title "UnalignedNaivePrecomputed"

