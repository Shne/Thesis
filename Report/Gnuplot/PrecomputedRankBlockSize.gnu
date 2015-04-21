#!/usr/bin/gnuplot

set key outside top horizontal
set term epslatex size 5.2,3.1 color font "" 8
set border





# WALL TIME
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::::1 using 2 nooutput #avg
# naiveinteger_avg_stddev_rank = sprintf("%.2f",STATS_min)
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::::0 using 2 nooutput #max
# naiveinteger_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::::1 using 2 nooutput #avg
naiveprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::::0 using 2 nooutput #max
naiveprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::::1 using 2 nooutput #avg
unalignednaiveprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::::0 using 2 nooutput #max
unalignednaiveprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::::1 using 2 nooutput #avg
preallocatedprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::::0 using 2 nooutput #max
preallocatedprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::::1 using 2 nooutput #avg
unalignedpreallocatedprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::::0 using 2 nooutput #max
unalignedpreallocatedprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)


# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Select.data' every ::::1 using 2 nooutput #avg
# naiveinteger_avg_stddev_select = sprintf("%.2f",STATS_min)
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Select.data' every ::::0 using 2 nooutput #max
# naiveinteger_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::::1 using 2 nooutput #avg
naiveprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::::0 using 2 nooutput #max
naiveprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::::1 using 2 nooutput #avg
unalignednaiveprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::::0 using 2 nooutput #max
unalignednaiveprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::::1 using 2 nooutput #avg
preallocatedprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::::0 using 2 nooutput #max
preallocatedprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::::1 using 2 nooutput #avg
unalignedpreallocatedprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::::0 using 2 nooutput #max
unalignedpreallocatedprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

set xlabel "Block Size (number of pages)"
set ylabel "Wall Time ($\\mu s$)"
set yrange [0:*]
set output 'PrecomputedRankBlockSize_Rank_WallTime.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::2 using ($3/32768):2 with linespoints linetype 1 title "Naive, $mr\\hat{\\sigma}=$ ".naiveprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):2:12 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):2 with linespoints linetype 2 title "Preallocated, $mr\\hat{\\sigma}=$ ".preallocatedprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".preallocatedprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):2:12 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::2 using ($3/32768):2 with linespoints linetype 3 title "UnalignedNaive, $mr\\hat{\\sigma}=$ ".unalignednaiveprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".unalignednaiveprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):2:12 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):2 with linespoints linetype 4 title "UnalignedPreallocated, $mr\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):2:12 with yerrorbars linetype 4 notitle,\
	
	# '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::2 using ($3/32768):($2/100) with linespoints title "NaiveInteger, $mr\\hat{\\sigma}=$ ".naiveinteger_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveinteger_avg_stddev_rank
set output 'PrecomputedRankBlockSize_Select_WallTime.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::2 using ($3/32768):2 with linespoints linetype 1 title "Naive, $mr\\hat{\\sigma}=$ ".naiveprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".naiveprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):2:12 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):2 with linespoints linetype 2 title "Preallocated, $mr\\hat{\\sigma}=$ ".preallocatedprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".preallocatedprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):2:12 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::2 using ($3/32768):2 with linespoints linetype 3 title "UnalignedNaive, $mr\\hat{\\sigma}=$ ".unalignednaiveprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".unalignednaiveprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):2:12 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):2 with linespoints linetype 4 title "UnalignedPreallocated, $mr\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):2:12 with yerrorbars linetype 4 notitle,\
	








# TOTAL CYCLES
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::::1 using 11 nooutput #avg
# naiveinteger_avg_stddev_rank = sprintf("%.2f",STATS_min)
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::::0 using 11 nooutput #max
# naiveinteger_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::::1 using 11 nooutput #avg
naiveprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::::0 using 11 nooutput #max
naiveprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::::1 using 11 nooutput #avg
preallocatedprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::::0 using 11 nooutput #max
preallocatedprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::::1 using 11 nooutput #avg
unalignednaiveprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::::0 using 11 nooutput #max
unalignednaiveprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::::1 using 11 nooutput #avg
unalignedpreallocatedprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::::0 using 11 nooutput #max
unalignedpreallocatedprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)


# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Select.data' every ::::1 using 11 nooutput #avg
# naiveinteger_avg_stddev_select = sprintf("%.2f",STATS_min)
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Select.data' every ::::0 using 11 nooutput #max
# naiveinteger_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::::1 using 11 nooutput #avg
naiveprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::::0 using 11 nooutput #max
naiveprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::::1 using 11 nooutput #avg
preallocatedprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::::0 using 11 nooutput #max
preallocatedprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::::1 using 11 nooutput #avg
unalignednaiveprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::::0 using 11 nooutput #max
unalignednaiveprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::::1 using 11 nooutput #avg
unalignedpreallocatedprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::::0 using 11 nooutput #max
unalignedpreallocatedprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

set xlabel "Block Size (number of pages)"
set ylabel "Total Cycles in Millions"
set yrange [0:*]
set output 'PrecomputedRankBlockSize_Rank_TotalCycles.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::2 using ($3/32768):($11/1000000) with linespoints linetype 1 title "Naive, $mr\\hat{\\sigma}=$ ".naiveprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):($11/1000000):($20/1000000) with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):($11/1000000) with linespoints linetype 2 title "Preallocated, $mr\\hat{\\sigma}=$ ".preallocatedprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".preallocatedprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):($11/1000000):($20/1000000) with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::2 using ($3/32768):($11/1000000) with linespoints linetype 3 title "UnalignedNaive, $mr\\hat{\\sigma}=$ ".unalignednaiveprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".unalignednaiveprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):($11/1000000):($20/1000000) with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):($11/1000000) with linespoints linetype 4 title "UnalignedPreallocated, $mr\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):($11/1000000):($20/1000000) with yerrorbars linetype 4 notitle,\
	# '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::2 using ($3/32768):($11/1000000) with linespoints title "NaiveInteger, $mr\\hat{\\sigma}=$ ".naiveinteger_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveinteger_avg_stddev_rank
set output 'PrecomputedRankBlockSize_Select_TotalCycles.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::2 using ($3/32768):($11/1000000) with linespoints linetype 1 title "Naive, $mr\\hat{\\sigma}=$ ".naiveprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".naiveprecomputed_avg_stddev_select,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):($11/1000000) with linespoints linetype 2 title "Preallocated, $mr\\hat{\\sigma}=$ ".preallocatedprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".preallocatedprecomputed_avg_stddev_select,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::2 using ($3/32768):($11/1000000) with linespoints linetype 3 title "UnalignedNaive, $mr\\hat{\\sigma}=$ ".unalignednaiveprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".unalignednaiveprecomputed_avg_stddev_select,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):($11/1000000) with linespoints linetype 4 title "UnalignedPreallocated, $mr\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_avg_stddev_select,\





# BRANCH MISPREDICTIONS
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::::1 using 5 nooutput #avg
# naiveinteger_avg_stddev_rank = sprintf("%.2f",STATS_min)
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::::0 using 5 nooutput #max
# naiveinteger_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::::1 using 5 nooutput #avg
naiveprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::::0 using 5 nooutput #max
naiveprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::::1 using 5 nooutput #avg
preallocatedprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::::0 using 5 nooutput #max
preallocatedprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::::1 using 5 nooutput #avg
unalignednaiveprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::::0 using 5 nooutput #max
unalignednaiveprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::::1 using 5 nooutput #avg
unalignedpreallocatedprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::::0 using 5 nooutput #max
unalignedpreallocatedprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)


# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Select.data' every ::::1 using 5 nooutput #avg
# naiveinteger_avg_stddev_select = sprintf("%.2f",STATS_min)
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Select.data' every ::::0 using 5 nooutput #max
# naiveinteger_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::::1 using 5 nooutput #avg
naiveprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::::0 using 5 nooutput #max
naiveprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::::1 using 5 nooutput #avg
preallocatedprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::::0 using 5 nooutput #max
preallocatedprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::::1 using 5 nooutput #avg
unalignednaiveprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::::0 using 5 nooutput #max
unalignednaiveprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::::1 using 5 nooutput #avg
unalignedpreallocatedprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::::0 using 5 nooutput #max
unalignedpreallocatedprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)


set xlabel "Block Size (number of pages)"
set ylabel "Branch Mispredictions"
set yrange [0:*]
set output 'PrecomputedRankBlockSize_Rank_BranchMiss.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::2 using ($3/32768):5 with linespoints linetype 1 title "Naive, $mr\\hat{\\sigma}=$ ".naiveprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):5:14 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):5 with linespoints linetype 2 title "Preallocated, $mr\\hat{\\sigma}=$ ".preallocatedprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".preallocatedprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):5:14 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::2 using ($3/32768):5 with linespoints linetype 3 title "UnalignedNaive, $mr\\hat{\\sigma}=$ ".unalignednaiveprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".unalignednaiveprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):5:14 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):5 with linespoints linetype 4 title "UnalignedPreallocated, $mr\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):5:14 with yerrorbars linetype 4 notitle,\
	# '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::2 using ($3/32768):5 with linespoints title "NaiveInteger, $mr\\hat{\\sigma}=$ ".naiveinteger_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveinteger_avg_stddev_rank

set yrange [*:*]
set output 'PrecomputedRankBlockSize_Select_BranchMiss.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::2 using ($3/32768):5 with linespoints linetype 1 title "Naive, $mr\\hat{\\sigma}=$ ".naiveprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".naiveprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):5:14 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):5 with linespoints linetype 2 title "Preallocated, $mr\\hat{\\sigma}=$ ".preallocatedprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".preallocatedprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):5:14 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::2 using ($3/32768):5 with linespoints linetype 3 title "UnalignedNaive, $mr\\hat{\\sigma}=$ ".unalignednaiveprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".unalignednaiveprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):5:14 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):5 with linespoints linetype 4 title "UnalignedPreallocated, $mr\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):5:14 with yerrorbars linetype 4 notitle,\

set yrange [0:*]







# BRANCH MISPREDICTION RATE
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::::1 using 4 nooutput #avg
# naiveinteger_avg_stddev_rank = sprintf("%.2f",STATS_min)
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::::0 using 4 nooutput #max
# naiveinteger_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::::1 using 4 nooutput #avg
naiveprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::::0 using 4 nooutput #max
naiveprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::::1 using 4 nooutput #avg
preallocatedprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::::0 using 4 nooutput #max
preallocatedprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::::1 using 4 nooutput #avg
unalignednaiveprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::::0 using 4 nooutput #max
unalignednaiveprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::::1 using 4 nooutput #avg
unalignedpreallocatedprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::::0 using 4 nooutput #max
unalignedpreallocatedprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)


# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Select.data' every ::::1 using 4 nooutput #avg
# naiveinteger_avg_stddev_select = sprintf("%.2f",STATS_min)
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Select.data' every ::::0 using 4 nooutput #max
# naiveinteger_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::::1 using 4 nooutput #avg
naiveprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::::0 using 4 nooutput #max
naiveprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::::1 using 4 nooutput #avg
preallocatedprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::::0 using 4 nooutput #max
preallocatedprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::::1 using 4 nooutput #avg
unalignednaiveprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::::0 using 4 nooutput #max
unalignednaiveprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::::1 using 4 nooutput #avg
unalignedpreallocatedprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::::0 using 4 nooutput #max
unalignedpreallocatedprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

set xlabel "Block Size (number of pages)"
set ylabel "Branch Misprediction Rate"
set yrange [0:*]
set output 'PrecomputedRankBlockSize_Rank_BranchMissRate.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::2 using ($3/32768):4 with linespoints linetype 1 title "Naive, $mr\\hat{\\sigma}=$ ".naiveprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):4:13 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):4 with linespoints linetype 2 title "Preallocated, $mr\\hat{\\sigma}=$ ".preallocatedprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".preallocatedprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):4:13 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::2 using ($3/32768):4 with linespoints linetype 3 title "UnalignedNaive, $mr\\hat{\\sigma}=$ ".unalignednaiveprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".unalignednaiveprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):4:13 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):4 with linespoints linetype 4 title "UnalignedPreallocated, $mr\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):4:13 with yerrorbars linetype 4 notitle,\
	# '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::2 using ($3/32768):4 with linespoints title "NaiveInteger, $mr\\hat{\\sigma}=$ ".naiveinteger_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveinteger_avg_stddev_rank
set output 'PrecomputedRankBlockSize_Select_BranchMissRate.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::2 using ($3/32768):4 with linespoints linetype 1 title "Naive, $mr\\hat{\\sigma}=$ ".naiveprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".naiveprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):4:13 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):4 with linespoints linetype 2 title "Preallocated, $mr\\hat{\\sigma}=$ ".preallocatedprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".preallocatedprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):4:13 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::2 using ($3/32768):4 with linespoints linetype 3 title "UnalignedNaive, $mr\\hat{\\sigma}=$ ".unalignednaiveprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".unalignednaiveprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):4:13 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):4 with linespoints linetype 4 title "UnalignedPreallocated, $mr\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):4:13 with yerrorbars linetype 4 notitle,\






# TLB MISSES
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::::1 using 6 nooutput #avg
# naiveinteger_avg_stddev_rank = sprintf("%.2f",STATS_min)
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::::0 using 6 nooutput #max
# naiveinteger_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::::1 using 6 nooutput #avg
naiveprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::::0 using 6 nooutput #max
naiveprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::::1 using 6 nooutput #avg
preallocatedprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::::0 using 6 nooutput #max
preallocatedprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::::1 using 6 nooutput #avg
unalignednaiveprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::::0 using 6 nooutput #max
unalignednaiveprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::::1 using 6 nooutput #avg
unalignedpreallocatedprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::::0 using 6 nooutput #max
unalignedpreallocatedprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)


# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Select.data' every ::::1 using 6 nooutput #avg
# naiveinteger_avg_stddev_select = sprintf("%.2f",STATS_min)
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Select.data' every ::::0 using 6 nooutput #max
# naiveinteger_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::::1 using 6 nooutput #avg
naiveprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::::0 using 6 nooutput #max
naiveprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::::1 using 6 nooutput #avg
preallocatedprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::::0 using 6 nooutput #max
preallocatedprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::::1 using 6 nooutput #avg
unalignednaiveprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::::0 using 6 nooutput #max
unalignednaiveprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::::1 using 6 nooutput #avg
unalignedpreallocatedprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::::0 using 6 nooutput #max
unalignedpreallocatedprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

set xlabel "Block Size (number of pages)"
set ylabel "TLB Misses"
set yrange [0:*]
set output 'PrecomputedRankBlockSize_Rank_TLB.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::2 using ($3/32768):6 with linespoints linetype 1 title "Naive, $mr\\hat{\\sigma}=$ ".naiveprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):6:15 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):6 with linespoints linetype 2 title "Preallocated, $mr\\hat{\\sigma}=$ ".preallocatedprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".preallocatedprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):6:15 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::2 using ($3/32768):6 with linespoints linetype 3 title "UnalignedNaive, $mr\\hat{\\sigma}=$ ".unalignednaiveprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".unalignednaiveprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):6:15 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):6 with linespoints linetype 4 title "UnalignedPreallocated, $mr\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):6:15 with yerrorbars linetype 4 notitle,\
	# '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::2 using ($3/32768):6 with linespoints title "NaiveInteger, $mr\\hat{\\sigma}=$ ".naiveinteger_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveinteger_avg_stddev_rank
set output 'PrecomputedRankBlockSize_Select_TLB.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::2 using ($3/32768):6 with linespoints linetype 1 title "Naive, $mr\\hat{\\sigma}=$ ".naiveprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".naiveprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):6:15 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):6 with linespoints linetype 2 title "Preallocated, $mr\\hat{\\sigma}=$ ".preallocatedprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".preallocatedprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):6:15 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::2 using ($3/32768):6 with linespoints linetype 3 title "UnalignedNaive, $mr\\hat{\\sigma}=$ ".unalignednaiveprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".unalignednaiveprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):6:15 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):6 with linespoints linetype 4 title "UnalignedPreallocated, $mr\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):6:15 with yerrorbars linetype 4 notitle,\





# LEVEL 1 CACHE MISSES
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::::1 using 7 nooutput #avg
# naiveinteger_avg_stddev_rank = sprintf("%.2f",STATS_min)
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::::0 using 7 nooutput #max
# naiveinteger_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::::1 using 7 nooutput #avg
naiveprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::::0 using 7 nooutput #max
naiveprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::::1 using 7 nooutput #avg
preallocatedprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::::0 using 7 nooutput #max
preallocatedprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::::1 using 7 nooutput #avg
unalignednaiveprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::::0 using 7 nooutput #max
unalignednaiveprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::::1 using 7 nooutput #avg
unalignedpreallocatedprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::::0 using 7 nooutput #max
unalignedpreallocatedprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)


# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Select.data' every ::::1 using 7 nooutput #avg
# naiveinteger_avg_stddev_select = sprintf("%.2f",STATS_min)
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Select.data' every ::::0 using 7 nooutput #max
# naiveinteger_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::::1 using 7 nooutput #avg
naiveprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::::0 using 7 nooutput #max
naiveprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::::1 using 7 nooutput #avg
preallocatedprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::::0 using 7 nooutput #max
preallocatedprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::::1 using 7 nooutput #avg
unalignednaiveprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::::0 using 7 nooutput #max
unalignednaiveprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::::1 using 7 nooutput #avg
unalignedpreallocatedprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::::0 using 7 nooutput #max
unalignedpreallocatedprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

set xlabel "Block Size (number of pages)"
set ylabel "Cache Misses"
set yrange [0:*]
set output 'PrecomputedRankBlockSize_Rank_L1CacheMiss.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::2 using ($3/32768):7 with linespoints linetype 1 title "Naive, $mr\\hat{\\sigma}=$ ".naiveprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):7:16 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):7 with linespoints linetype 2 title "Preallocated, $mr\\hat{\\sigma}=$ ".preallocatedprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".preallocatedprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):7:16 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::2 using ($3/32768):7 with linespoints linetype 3 title "UnalignedNaive, $mr\\hat{\\sigma}=$ ".unalignednaiveprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".unalignednaiveprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):7:16 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):7 with linespoints linetype 4 title "UnalignedPreallocated, $mr\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):7:16 with yerrorbars linetype 4 notitle,\
	# '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::2 using ($3/32768):7 with linespoints title "NaiveInteger, $mr\\hat{\\sigma}=$ ".naiveinteger_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveinteger_avg_stddev_rank
set output 'PrecomputedRankBlockSize_Select_L1CacheMiss.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::2 using ($3/32768):7 with linespoints linetype 1 title "Naive, $mr\\hat{\\sigma}=$ ".naiveprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".naiveprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):7:16 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):7 with linespoints linetype 2 title "Preallocated, $mr\\hat{\\sigma}=$ ".preallocatedprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".preallocatedprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):7:16 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::2 using ($3/32768):7 with linespoints linetype 3 title "UnalignedNaive, $mr\\hat{\\sigma}=$ ".unalignednaiveprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".unalignednaiveprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):7:16 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):7 with linespoints linetype 4 title "UnalignedPreallocated, $mr\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):7:16 with yerrorbars linetype 4 notitle,\









# LEVEL 2 CACHE MISS RATE
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::::1 using ($8/($8+$9)) nooutput #avg
# naiveinteger_avg_stddev_rank = sprintf("%.2f",STATS_min)
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::::0 using ($8/($8+$9)) nooutput #max
# naiveinteger_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::::1 using ($8/($8+$9)) nooutput #avg
naiveprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::::0 using ($8/($8+$9)) nooutput #max
naiveprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::::1 using ($8/($8+$9)) nooutput #avg
preallocatedprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::::0 using ($8/($8+$9)) nooutput #max
preallocatedprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::::1 using ($8/($8+$9)) nooutput #avg
unalignednaiveprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::::0 using ($8/($8+$9)) nooutput #max
unalignednaiveprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::::1 using ($8/($8+$9)) nooutput #avg
unalignedpreallocatedprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::::0 using ($8/($8+$9)) nooutput #max
unalignedpreallocatedprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)


# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Select.data' every ::::1 using ($8/($8+$9)) nooutput #avg
# naiveinteger_avg_stddev_select = sprintf("%.2f",STATS_min)
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Select.data' every ::::0 using ($8/($8+$9)) nooutput #max
# naiveinteger_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::::1 using ($8/($8+$9)) nooutput #avg
naiveprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::::0 using ($8/($8+$9)) nooutput #max
naiveprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::::1 using ($8/($8+$9)) nooutput #avg
preallocatedprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::::0 using ($8/($8+$9)) nooutput #max
preallocatedprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::::1 using ($8/($8+$9)) nooutput #avg
unalignednaiveprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::::0 using ($8/($8+$9)) nooutput #max
unalignednaiveprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::::1 using ($8/($8+$9)) nooutput #avg
unalignedpreallocatedprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::::0 using ($8/($8+$9)) nooutput #max
unalignedpreallocatedprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

set xlabel "Block Size (number of pages)"
set ylabel "Cache Miss Rate"
set yrange [0:*]
set output 'PrecomputedRankBlockSize_Rank_L2CacheMissRate.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::2 using ($3/32768):($8/($8+$9)) with linespoints linetype 1 title "Naive, $mr\\hat{\\sigma}=$ ".naiveprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):($8/($8+$9)):($17/($8+$9)) with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):($8/($8+$9)) with linespoints linetype 2 title "Preallocated, $mr\\hat{\\sigma}=$ ".preallocatedprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".preallocatedprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):($8/($8+$9)):($17/($8+$9)) with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::2 using ($3/32768):($8/($8+$9)) with linespoints linetype 3 title "UnalignedNaive, $mr\\hat{\\sigma}=$ ".unalignednaiveprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".unalignednaiveprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):($8/($8+$9)):($17/($8+$9)) with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):($8/($8+$9)) with linespoints linetype 4 title "UnalignedPreallocated, $mr\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):($8/($8+$9)):($17/($8+$9)) with yerrorbars linetype 4 notitle,\
	# '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::2 using ($3/32768):($8/($8+$9)) with linespoints title "NaiveInteger, $mr\\hat{\\sigma}=$ ".naiveinteger_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveinteger_avg_stddev_rank
set output 'PrecomputedRankBlockSize_Select_L2CacheMissRate.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::2 using ($3/32768):($8/($8+$9)) with linespoints linetype 1 title "Naive, $mr\\hat{\\sigma}=$ ".naiveprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".naiveprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):($8/($8+$9)):($17/($8+$9)) with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):($8/($8+$9)) with linespoints linetype 2 title "Preallocated, $mr\\hat{\\sigma}=$ ".preallocatedprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".preallocatedprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):($8/($8+$9)):($17/($8+$9)) with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::2 using ($3/32768):($8/($8+$9)) with linespoints linetype 3 title "UnalignedNaive, $mr\\hat{\\sigma}=$ ".unalignednaiveprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".unalignednaiveprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):($8/($8+$9)):($17/($8+$9)) with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):($8/($8+$9)) with linespoints linetype 4 title "UnalignedPreallocated, $mr\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):($8/($8+$9)):($17/($8+$9)) with yerrorbars linetype 4 notitle,\










# LEVEL 2 CACHE MISSES
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::::1 using 8 nooutput #avg
# naiveinteger_avg_stddev_rank = sprintf("%.2f",STATS_min)
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::::0 using 8 nooutput #max
# naiveinteger_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::::1 using 8 nooutput #avg
naiveprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::::0 using 8 nooutput #max
naiveprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::::1 using 8 nooutput #avg
preallocatedprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::::0 using 8 nooutput #max
preallocatedprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::::1 using 8 nooutput #avg
unalignednaiveprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::::0 using 8 nooutput #max
unalignednaiveprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::::1 using 8 nooutput #avg
unalignedpreallocatedprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::::0 using 8 nooutput #max
unalignedpreallocatedprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)


# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Select.data' every ::::1 using 8 nooutput #avg
# naiveinteger_avg_stddev_select = sprintf("%.2f",STATS_min)
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Select.data' every ::::0 using 8 nooutput #max
# naiveinteger_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::::1 using 8 nooutput #avg
naiveprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::::0 using 8 nooutput #max
naiveprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::::1 using 8 nooutput #avg
preallocatedprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::::0 using 8 nooutput #max
preallocatedprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::::1 using 8 nooutput #avg
unalignednaiveprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::::0 using 8 nooutput #max
unalignednaiveprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::::1 using 8 nooutput #avg
unalignedpreallocatedprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::::0 using 8 nooutput #max
unalignedpreallocatedprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

set xlabel "Block Size (number of pages)"
set ylabel "Cache Misses"
set yrange [0:*]
set output 'PrecomputedRankBlockSize_Rank_L2CacheMiss.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::2 using ($3/32768):8 with linespoints linetype 1 title "Naive, $mr\\hat{\\sigma}=$ ".naiveprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):8:17 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):8 with linespoints linetype 2 title "Preallocated, $mr\\hat{\\sigma}=$ ".preallocatedprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".preallocatedprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):8:17 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::2 using ($3/32768):8 with linespoints linetype 3 title "UnalignedNaive, $mr\\hat{\\sigma}=$ ".unalignednaiveprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".unalignednaiveprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):8:17 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):8 with linespoints linetype 4 title "UnalignedPreallocated, $mr\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):8:17 with yerrorbars linetype 4 notitle,\
	# '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::2 using ($3/32768):8 with linespoints title "NaiveInteger, $mr\\hat{\\sigma}=$ ".naiveinteger_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveinteger_avg_stddev_rank
set output 'PrecomputedRankBlockSize_Select_L2CacheMiss.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::2 using ($3/32768):8 with linespoints linetype 1 title "Naive, $mr\\hat{\\sigma}=$ ".naiveprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".naiveprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):8:17 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):8 with linespoints linetype 2 title "Preallocated, $mr\\hat{\\sigma}=$ ".preallocatedprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".preallocatedprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):8:17 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::2 using ($3/32768):8 with linespoints linetype 3 title "UnalignedNaive, $mr\\hat{\\sigma}=$ ".unalignednaiveprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".unalignednaiveprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):8:17 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):8 with linespoints linetype 4 title "UnalignedPreallocated, $mr\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):8:17 with yerrorbars linetype 4 notitle,\













# LEVEL 3 CACHE MISSES
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::::1 using 10 nooutput #avg
# naiveinteger_avg_stddev_rank = sprintf("%.2f",STATS_min)
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::::0 using 10 nooutput #max
# naiveinteger_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::::1 using 10 nooutput #avg
naiveprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::::0 using 10 nooutput #max
naiveprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::::1 using 10 nooutput #avg
preallocatedprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::::0 using 10 nooutput #max
preallocatedprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::::1 using 10 nooutput #avg
unalignednaiveprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::::0 using 10 nooutput #max
unalignednaiveprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::::1 using 10 nooutput #avg
unalignedpreallocatedprecomputed_avg_stddev_rank = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::::0 using 10 nooutput #max
unalignedpreallocatedprecomputed_max_stddev_rank = sprintf("%.2f",STATS_min)


# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Select.data' every ::::1 using 10 nooutput #avg
# naiveinteger_avg_stddev_select = sprintf("%.2f",STATS_min)
# stats '../Data/PrecomputedRankBlockSize_NaiveInteger_Select.data' every ::::0 using 10 nooutput #max
# naiveinteger_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::::1 using 10 nooutput #avg
naiveprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::::0 using 10 nooutput #max
naiveprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::::1 using 10 nooutput #avg
preallocatedprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::::0 using 10 nooutput #max
preallocatedprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::::1 using 10 nooutput #avg
unalignednaiveprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::::0 using 10 nooutput #max
unalignednaiveprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::::1 using 10 nooutput #avg
unalignedpreallocatedprecomputed_avg_stddev_select = sprintf("%.2f",STATS_min)
stats '../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::::0 using 10 nooutput #max
unalignedpreallocatedprecomputed_max_stddev_select = sprintf("%.2f",STATS_min)

set xlabel "Block Size (number of pages)"
set ylabel "Cache Misses"
set yrange [0:*]
set output 'PrecomputedRankBlockSize_Rank_L3CacheMiss.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::2 using ($3/32768):10 with linespoints linetype 1 title "Naive, $mr\\hat{\\sigma}=$ ".naiveprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):10:19 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):10 with linespoints linetype 2 title "Preallocated, $mr\\hat{\\sigma}=$ ".preallocatedprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".preallocatedprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):10:19 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::2 using ($3/32768):10 with linespoints linetype 3 title "UnalignedNaive, $mr\\hat{\\sigma}=$ ".unalignednaiveprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".unalignednaiveprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):10:19 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):10 with linespoints linetype 4 title "UnalignedPreallocated, $mr\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_max_stddev_rank." $avg\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_avg_stddev_rank,\
	'' every ::2 using ($3/32768):10:19 with yerrorbars linetype 4 notitle,\
	# '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::2 using ($3/32768):10 with linespoints title "NaiveInteger, $mr\\hat{\\sigma}=$ ".naiveinteger_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveinteger_avg_stddev_rank
set output 'PrecomputedRankBlockSize_Select_L3CacheMiss.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::2 using ($3/32768):10 with linespoints linetype 1 title "Naive, $mr\\hat{\\sigma}=$ ".naiveprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".naiveprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):10:19 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):10 with linespoints linetype 2 title "Preallocated, $mr\\hat{\\sigma}=$ ".preallocatedprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".preallocatedprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):10:19 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::2 using ($3/32768):10 with linespoints linetype 3 title "UnalignedNaive, $mr\\hat{\\sigma}=$ ".unalignednaiveprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".unalignednaiveprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):10:19 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):10 with linespoints linetype 4 title "UnalignedPreallocated, $mr\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_max_stddev_select." $avg\\hat{\\sigma}=$ ".unalignedpreallocatedprecomputed_avg_stddev_select,\
	'' every ::2 using ($3/32768):10:19 with yerrorbars linetype 4 notitle,\

