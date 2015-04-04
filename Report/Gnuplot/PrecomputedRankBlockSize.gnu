#!/usr/bin/gnuplot

set key outside top horizontal spacing 2
set term epslatex size 5.2,3.1 color
set border

# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::::0 using 2 nooutput #avg
# naive_avg_stddev = sprintf("%g",STATS_min)
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::::1 using 2 nooutput #max
# naive_max_stddev = sprintf("%g",STATS_min)

stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::::0 using 2 nooutput #avg
naiveprecomputed_avg_stddev = sprintf("%g",STATS_min)
stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::::1 using 2 nooutput #max
naiveprecomputed_max_stddev = sprintf("%g",STATS_min)

stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::::0 using 2 nooutput #avg
preallocatedprecomputed_avg_stddev = sprintf("%g",STATS_min)
stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::::1 using 2 nooutput #max
preallocatedprecomputed_max_stddev = sprintf("%g",STATS_min)

# stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::::0 using 2 nooutput #avg
# unalignednaiveprecomputed_avg_stddev = sprintf("%g",STATS_min)
# stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::::1 using 2 nooutput #max
# unalignednaiveprecomputed_max_stddev = sprintf("%g",STATS_min)


set xlabel "Block Size in bits"
set ylabel "Wall Time"
set yrange [0:*]
set output 'PrecomputedRankBlockSize_Rank.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::2 using 3:2 with linespoints title "NaivePrecomputed, $mr\\hat{\\sigma}=$".naiveprecomputed_max_stddev." $avg\\hat{\\sigma}=$".naiveprecomputed_avg_stddev, \
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::2 using 3:2 with linespoints title "PreallocatedPrecomputed, $mr\\hat{\\sigma}=$".preallocatedprecomputed_max_stddev." $avg\\hat{\\sigma}=$".preallocatedprecomputed_avg_stddev
	# '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::2 using 3:2 with linespoints title "UnalignedNaivePrecomputed, $mr\\hat{\\sigma}=$".unalignednaiveprecomputed_max_stddev." $avg\\hat{\\sigma}=$".unalignednaiveprecomputed_avg_stddev
