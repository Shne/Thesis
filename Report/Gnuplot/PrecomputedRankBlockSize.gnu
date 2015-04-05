#!/usr/bin/gnuplot

set key outside top horizontal spacing 2
set term epslatex size 5.2,3.1 color
set border

stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::::0 using 2 nooutput #avg
naiveprecomputed_avg_stddev_rank = sprintf("%g",STATS_min)
stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::::1 using 2 nooutput #max
naiveprecomputed_max_stddev_rank = sprintf("%g",STATS_min)

stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::::0 using 2 nooutput #avg
preallocatedprecomputed_avg_stddev_rank = sprintf("%g",STATS_min)
stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::::1 using 2 nooutput #max
preallocatedprecomputed_max_stddev_rank = sprintf("%g",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::::0 using 2 nooutput #avg
unalignednaiveprecomputed_avg_stddev_rank = sprintf("%g",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::::1 using 2 nooutput #max
unalignednaiveprecomputed_max_stddev_rank = sprintf("%g",STATS_min)


stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::::0 using 2 nooutput #avg
naiveprecomputed_avg_stddev_select = sprintf("%g",STATS_min)
stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::::1 using 2 nooutput #max
naiveprecomputed_max_stddev_select = sprintf("%g",STATS_min)

stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::::0 using 2 nooutput #avg
preallocatedprecomputed_avg_stddev_select = sprintf("%g",STATS_min)
stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::::1 using 2 nooutput #max
preallocatedprecomputed_max_stddev_select = sprintf("%g",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::::0 using 2 nooutput #avg
unalignednaiveprecomputed_avg_stddev_select = sprintf("%g",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::::1 using 2 nooutput #max
unalignednaiveprecomputed_max_stddev_select = sprintf("%g",STATS_min)

# unalignednaiveprecomputed_avg_stddev_select = "derp"
# unalignednaiveprecomputed_max_stddev_select = "herp"

# WALL TIME
set xlabel "Block Size in bits"
set ylabel "Wall Time"
set yrange [0:*]
set output 'PrecomputedRankBlockSize_Rank_WallTime.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::2 using 3:2 with linespoints title "NaivePrecomputed, $mr\\hat{\\sigma}=$".naiveprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$".naiveprecomputed_avg_stddev_rank,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::2 using 3:2 with linespoints title "PreallocatedPrecomputed, $mr\\hat{\\sigma}=$".preallocatedprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$".preallocatedprecomputed_avg_stddev_rank,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::2 using 3:2 with linespoints title "UnalignedNaivePrecomputed, $mr\\hat{\\sigma}=$".unalignednaiveprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$".unalignednaiveprecomputed_avg_stddev_rank
set output 'PrecomputedRankBlockSize_Select_WallTime.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::2 using 3:2 with linespoints title "NaivePrecomputed, $mr\\hat{\\sigma}=$".naiveprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$".naiveprecomputed_avg_stddev_select,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::2 using 3:2 with linespoints title "PreallocatedPrecomputed, $mr\\hat{\\sigma}=$".preallocatedprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$".preallocatedprecomputed_avg_stddev_select,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::2 using 3:2 with linespoints title "UnalignedNaivePrecomputed, $mr\\hat{\\sigma}=$".unalignednaiveprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$".unalignednaiveprecomputed_avg_stddev_select


# MEMORY
# set xlabel "Block Size in bits"
# set ylabel "Memory Usage"
# set yrange [0:*]
# set output 'PrecomputedRankBlockSize_MemoryUsage.tex'
# plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::2 using 3:10 with linespoints title "NaivePrecomputed, $mr\\hat{\\sigma}=$".naiveprecomputed_max_stddev." $avg\\hat{\\sigma}=$".naiveprecomputed_avg_stddev, \
# 	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::2 using 3:10 with linespoints title "PreallocatedPrecomputed, $mr\\hat{\\sigma}=$".preallocatedprecomputed_max_stddev." $avg\\hat{\\sigma}=$".preallocatedprecomputed_avg_stddev,\
# 	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::2 using 3:2 with linespoints title "UnalignedNaivePrecomputed, $mr\\hat{\\sigma}=$".unalignednaiveprecomputed_max_stddev." $avg\\hat{\\sigma}=$".unalignednaiveprecomputed_avg_stddev

