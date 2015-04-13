#!/usr/bin/gnuplot

set key outside top horizontal
set term epslatex size 5.2,3.1 color
set border

stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::::1 using 2 nooutput #avg
naiveprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::::0 using 2 nooutput #max
naiveprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::::1 using 2 nooutput #avg
preallocatedprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::::0 using 2 nooutput #max
preallocatedprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::::1 using 2 nooutput #avg
unalignednaiveprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::::0 using 2 nooutput #max
unalignednaiveprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)


stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::::1 using 2 nooutput #avg
naiveprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::::0 using 2 nooutput #max
naiveprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::::1 using 2 nooutput #avg
preallocatedprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::::0 using 2 nooutput #max
preallocatedprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::::1 using 2 nooutput #avg
unalignednaiveprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::::0 using 2 nooutput #max
unalignednaiveprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)


# WALL TIME
set xlabel "Block Size (number of page sizes)"
set ylabel "Wall Time ($\\mu s$)"
set yrange [0:*]
set output 'PrecomputedRankBlockSize_Rank_WallTime.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::2 using ($3/32768):2 with linespoints title "NaivePrecomputed, $mr\\hat{\\sigma}=$ ".naiveprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveprecomputed_avg_stddev_rank,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):2 with linespoints title "PreallocatedPrecomputed, $mr\\hat{\\sigma}=$ ".preallocatedprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".preallocatedprecomputed_avg_stddev_rank,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::2 using ($3/32768):2 with linespoints title "UnalignedNaivePrecomputed, $mr\\hat{\\sigma}=$ ".unalignednaiveprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".unalignednaiveprecomputed_avg_stddev_rank
set output 'PrecomputedRankBlockSize_Select_WallTime.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::2 using ($3/32768):2 with linespoints title "NaivePrecomputed, $mr\\hat{\\sigma}=$ ".naiveprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".naiveprecomputed_avg_stddev_select,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):2 with linespoints title "PreallocatedPrecomputed, $mr\\hat{\\sigma}=$ ".preallocatedprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".preallocatedprecomputed_avg_stddev_select,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::2 using ($3/32768):2 with linespoints title "UnalignedNaivePrecomputed, $mr\\hat{\\sigma}=$ ".unalignednaiveprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".unalignednaiveprecomputed_avg_stddev_select


# MEMORY
# set xlabel "Block Size (number of page sizes)"
# set ylabel "Memory Usage"
# set yrange [*:*]
# set output 'PrecomputedRankBlockSize_MemoryUsage.tex'
# plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::2 using ($3/32768):10 with linespoints title "NaivePrecomputed, $mr\\hat{\\sigma}=$".naiveprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$".naiveprecomputed_avg_stddev_rank, \
# 	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):10 with linespoints title "PreallocatedPrecomputed, $mr\\hat{\\sigma}=$".preallocatedprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$".preallocatedprecomputed_avg_stddev_rank,\
# 	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::2 using ($3/32768):10 with linespoints title "UnalignedNaivePrecomputed, $mr\\hat{\\sigma}=$".unalignednaiveprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$".unalignednaiveprecomputed_avg_stddev_rank

