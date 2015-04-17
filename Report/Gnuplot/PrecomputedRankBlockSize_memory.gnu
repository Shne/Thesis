#!/usr/bin/gnuplot

set key outside top horizontal
set term epslatex size 5.2,3.1 color
set border

# stats '../Data/PrecomputedRankBlockSize_memory.data' using 2 nooutput
# naiveIntegerValue = STATS_min

# MEMORY
# set xlabel "Block Size (number of page sizes)"
# set ylabel "Memory Usage (MB)"
# set y2label "Relative to NaiveInteger"
# # set xrange [0:2]
# set yrange [700:740]
# set ytics nomirror
# set y2tics
# set y2range [700/(naiveIntegerValue/1048576):740/(naiveIntegerValue/1048576)]
# set output 'PrecomputedRankBlockSize_MemoryUsage.tex'
# plot '../Data/PrecomputedRankBlockSize_memory.data' using ($1/4096):($2/1048576) with linespoints title "NaiveInteger", \
# 	'../Data/PrecomputedRankBlockSize_memory.data' using ($1/4096):($3/1048576) with linespoints title "PreallocatedPrecomputed",\
# 	'../Data/PrecomputedRankBlockSize_memory.data' using ($1/4096):($4/1048576) with linespoints title "NaivePrecomputed",\
# 	'../Data/PrecomputedRankBlockSize_memory.data' using ($1/4096):($5/1048576) with linespoints title "UnalignedNaivePrecomputed"






# WALL TIME
stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Build.data' every ::::1 using 2 nooutput #avg
naiveinteger_avg_stddev_build = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Build.data' every ::::0 using 2 nooutput #max
naiveinteger_max_stddev_build = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Build.data' every ::::1 using 2 nooutput #avg
naiveprecomputed_avg_stddev_build = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Build.data' every ::::0 using 2 nooutput #max
naiveprecomputed_max_stddev_build = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Build.data' every ::::1 using 2 nooutput #avg
preallocatedprecomputed_avg_stddev_build = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Build.data' every ::::0 using 2 nooutput #max
preallocatedprecomputed_max_stddev_build = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Build.data' every ::::1 using 2 nooutput #avg
unalignednaiveprecomputed_avg_stddev_build = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Build.data' every ::::0 using 2 nooutput #max
unalignednaiveprecomputed_max_stddev_build = sprintf("%.2f",STATS_min)



set xlabel "Block Size (number of pages)"
set ylabel "Memory Usage (MB)"
# set yrange [0:*]
set output 'PrecomputedRankBlockSize_Build_Memory.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Build.data' every ::2 using ($1/32768):($2/4096) with linespoints title "NaivePrecomputed, $mr\\hat{\\sigma}=$ ".naiveprecomputed_max_stddev_build." $avg\\hat{\\sigma}=$ ".naiveprecomputed_avg_stddev_build,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Build.data' every ::2 using ($1/32768):($2/4096) with linespoints title "PreallocatedPrecomputed, $mr\\hat{\\sigma}=$ ".preallocatedprecomputed_max_stddev_build." $avg\\hat{\\sigma}=$ ".preallocatedprecomputed_avg_stddev_build,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Build.data' every ::2 using ($1/32768):($2/4096) with linespoints title "UnalignedNaivePrecomputed, $mr\\hat{\\sigma}=$ ".unalignednaiveprecomputed_max_stddev_build." $avg\\hat{\\sigma}=$ ".unalignednaiveprecomputed_avg_stddev_build,\
	'../Data/PrecomputedRankBlockSize_NaiveInteger_Build.data' every ::2 using ($1/32768):($2/4096) with linespoints title "NaiveInteger, $mr\\hat{\\sigma}=$ ".naiveinteger_max_stddev_build." $avg\\hat{\\sigma}=$ ".naiveinteger_avg_stddev_build
