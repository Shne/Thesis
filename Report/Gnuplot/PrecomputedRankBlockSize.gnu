#!/usr/bin/gnuplot

set key top horizontal
# set term epslatex size 6.5,4 color

set term epslatex size 3.2,2.5 color font "" 6
set border


# WALL TIME
set xlabel "Block Size (number of pages)"
set ylabel "Wall Time ($\\mu s$)"
set yrange [0:*]
set output 'PrecomputedRankBlockSize_Rank_WallTime.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::2 using ($3/32768):2 with linespoints linetype 1 title "Naive",\
	'' every ::2 using ($3/32768):2:13 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):2 with linespoints linetype 2 title "Preallocated",\
	'' every ::2 using ($3/32768):2:13 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::2 using ($3/32768):2 with linespoints linetype 3 title "UnalignedNaive",\
	'' every ::2 using ($3/32768):2:13 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):2 with linespoints linetype 4 title "UnalignedPreallocated",\
	'' every ::2 using ($3/32768):2:13 with yerrorbars linetype 4 notitle,\
	
	# '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::2 using ($3/32768):($2/100) with linespoints title "NaiveInteger, $mr\\hat{\\sigma}=$ ".naiveinteger_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveinteger_avg_stddev_rank
set yrange [0:19000]
set output 'PrecomputedRankBlockSize_Select_WallTime.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::2 using ($3/32768):2 with linespoints linetype 1 title "Naive",\
	'' every ::2 using ($3/32768):2:13 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):2 with linespoints linetype 2 title "Preallocated",\
	'' every ::2 using ($3/32768):2:13 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::2 using ($3/32768):2 with linespoints linetype 3 title "UnalignedNaive",\
	'' every ::2 using ($3/32768):2:13 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):2 with linespoints linetype 4 title "UnalignedPreallocated",\
	'' every ::2 using ($3/32768):2:13 with yerrorbars linetype 4 notitle,\

	

set term epslatex size 3.2,2.5 color font "" 6

# TOTAL CYCLES
set xlabel "Block Size (number of pages)"
set ylabel "Total Cycles in Millions"
set yrange [0:*]
set output 'PrecomputedRankBlockSize_Rank_TotalCycles.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::2 using ($3/32768):($12/1000000) with linespoints linetype 1 title "Naive",\
	'' every ::2 using ($3/32768):($12/1000000):($22/1000000) with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):($12/1000000) with linespoints linetype 2 title "Preallocated",\
	'' every ::2 using ($3/32768):($12/1000000):($22/1000000) with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::2 using ($3/32768):($12/1000000) with linespoints linetype 3 title "UnalignedNaive",\
	'' every ::2 using ($3/32768):($12/1000000):($22/1000000) with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):($12/1000000) with linespoints linetype 4 title "UnalignedPreallocated",\
	'' every ::2 using ($3/32768):($12/1000000):($22/1000000) with yerrorbars linetype 4 notitle,\
	# '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::2 using ($3/32768):($12/1000000) with linespoints title "NaiveInteger, $mr\\hat{\\sigma}=$ ".naiveinteger_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveinteger_avg_stddev_rank
set output 'PrecomputedRankBlockSize_Select_TotalCycles.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::2 using ($3/32768):($12/1000000) with linespoints linetype 1 title "Naive",\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):($12/1000000) with linespoints linetype 2 title "Preallocated",\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::2 using ($3/32768):($12/1000000) with linespoints linetype 3 title "UnalignedNaive",\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):($12/1000000) with linespoints linetype 4 title "UnalignedPreallocated",\



# BRANCH MISPREDICTIONS
set xlabel "Block Size (number of pages)"
set ylabel "Branch Mispredictions"
set yrange [0:70000]
set output 'PrecomputedRankBlockSize_Rank_BranchMiss.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::2 using ($3/32768):5 with linespoints linetype 1 title "Naive",\
	'' every ::2 using ($3/32768):5:15 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):5 with linespoints linetype 2 title "Preallocated",\
	'' every ::2 using ($3/32768):5:15 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::2 using ($3/32768):5 with linespoints linetype 3 title "UnalignedNaive",\
	'' every ::2 using ($3/32768):5:15 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):5 with linespoints linetype 4 title "UnalignedPreallocated",\
	'' every ::2 using ($3/32768):5:15 with yerrorbars linetype 4 notitle,\
	# '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::2 using ($3/32768):5 with linespoints title "NaiveInteger, $mr\\hat{\\sigma}=$ ".naiveinteger_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveinteger_avg_stddev_rank

set yrange [*:*]
set output 'PrecomputedRankBlockSize_Select_BranchMiss.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::2 using ($3/32768):5 with linespoints linetype 1 title "Naive",\
	'' every ::2 using ($3/32768):5:15 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):5 with linespoints linetype 2 title "Preallocated",\
	'' every ::2 using ($3/32768):5:15 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::2 using ($3/32768):5 with linespoints linetype 3 title "UnalignedNaive",\
	'' every ::2 using ($3/32768):5:15 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):5 with linespoints linetype 4 title "UnalignedPreallocated",\
	'' every ::2 using ($3/32768):5:15 with yerrorbars linetype 4 notitle,\

set yrange [0:*]



# BRANCHES EXECUTED
set xlabel "Block Size (number of pages)"
set ylabel "Branches Executed"
set yrange [0:*]
set output 'PrecomputedRankBlockSize_Rank_BranchExe.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::2 using ($3/32768):6 with linespoints linetype 1 title "Naive",\
	'' every ::2 using ($3/32768):6:16 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):6 with linespoints linetype 2 title "Preallocated",\
	'' every ::2 using ($3/32768):6:16 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::2 using ($3/32768):6 with linespoints linetype 3 title "UnalignedNaive",\
	'' every ::2 using ($3/32768):6:16 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):6 with linespoints linetype 4 title "UnalignedPreallocated",\
	'' every ::2 using ($3/32768):6:16 with yerrorbars linetype 4 notitle,\
	# '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::2 using ($3/32768):6 with linespoints title "NaiveInteger, $mr\\hat{\\sigma}=$ ".naiveinteger_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveinteger_avg_stddev_rank

set yrange [0:*]
set output 'PrecomputedRankBlockSize_Select_BranchExe.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::2 using ($3/32768):6 with linespoints linetype 1 title "Naive",\
	'' every ::2 using ($3/32768):6:16 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):6 with linespoints linetype 2 title "Preallocated",\
	'' every ::2 using ($3/32768):6:16 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::2 using ($3/32768):6 with linespoints linetype 3 title "UnalignedNaive",\
	'' every ::2 using ($3/32768):6:16 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):6 with linespoints linetype 4 title "UnalignedPreallocated",\
	'' every ::2 using ($3/32768):6:16 with yerrorbars linetype 4 notitle,\




# BRANCH MISPREDICTION RATE
set xlabel "Block Size (number of pages)"
set ylabel "Branch Misprediction Rate"
set yrange [0:0.02]
set output 'PrecomputedRankBlockSize_Rank_BranchMissRate.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::2 using ($3/32768):4 with linespoints linetype 1 title "Naive",\
	'' every ::2 using ($3/32768):4:14 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):4 with linespoints linetype 2 title "Preallocated",\
	'' every ::2 using ($3/32768):4:14 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::2 using ($3/32768):4 with linespoints linetype 3 title "UnalignedNaive",\
	'' every ::2 using ($3/32768):4:14 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):4 with linespoints linetype 4 title "UnalignedPreallocated",\
	'' every ::2 using ($3/32768):4:14 with yerrorbars linetype 4 notitle,\
	# '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::2 using ($3/32768):4 with linespoints title "NaiveInteger, $mr\\hat{\\sigma}=$ ".naiveinteger_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveinteger_avg_stddev_rank
set yrange [0:0.031]
set output 'PrecomputedRankBlockSize_Select_BranchMissRate.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::2 using ($3/32768):4 with linespoints linetype 1 title "Naive",\
	'' every ::2 using ($3/32768):4:14 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):4 with linespoints linetype 2 title "Preallocated",\
	'' every ::2 using ($3/32768):4:14 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::2 using ($3/32768):4 with linespoints linetype 3 title "UnalignedNaive",\
	'' every ::2 using ($3/32768):4:14 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):4 with linespoints linetype 4 title "UnalignedPreallocated",\
	'' every ::2 using ($3/32768):4:14 with yerrorbars linetype 4 notitle,\



# TLB MISSES
set xlabel "Block Size (number of pages)"
set ylabel "TLB Misses"
set yrange [0:*]
set output 'PrecomputedRankBlockSize_Rank_TLB.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::2 using ($3/32768):7 with linespoints linetype 1 title "Naive",\
	'' every ::2 using ($3/32768):7:17 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):7 with linespoints linetype 2 title "Preallocated",\
	'' every ::2 using ($3/32768):7:17 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::2 using ($3/32768):7 with linespoints linetype 3 title "UnalignedNaive",\
	'' every ::2 using ($3/32768):7:17 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):7 with linespoints linetype 4 title "UnalignedPreallocated",\
	'' every ::2 using ($3/32768):7:17 with yerrorbars linetype 4 notitle,\
	# '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::2 using ($3/32768):7 with linespoints title "NaiveInteger, $mr\\hat{\\sigma}=$ ".naiveinteger_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveinteger_avg_stddev_rank
set yrange [0:9000]
set output 'PrecomputedRankBlockSize_Select_TLB.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::2 using ($3/32768):7 with linespoints linetype 1 title "Naive",\
	'' every ::2 using ($3/32768):7:17 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):7 with linespoints linetype 2 title "Preallocated",\
	'' every ::2 using ($3/32768):7:17 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::2 using ($3/32768):7 with linespoints linetype 3 title "UnalignedNaive",\
	'' every ::2 using ($3/32768):7:17 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):7 with linespoints linetype 4 title "UnalignedPreallocated",\
	'' every ::2 using ($3/32768):7:17 with yerrorbars linetype 4 notitle,\



# LEVEL 1 CACHE MISSES
set xlabel "Block Size (number of pages)"
set ylabel "Cache Misses"
set yrange [0:*]
set output 'PrecomputedRankBlockSize_Rank_L1CacheMiss.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::2 using ($3/32768):8 with linespoints linetype 1 title "Naive",\
	'' every ::2 using ($3/32768):8:18 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):8 with linespoints linetype 2 title "Preallocated",\
	'' every ::2 using ($3/32768):8:18 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::2 using ($3/32768):8 with linespoints linetype 3 title "UnalignedNaive",\
	'' every ::2 using ($3/32768):8:18 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):8 with linespoints linetype 4 title "UnalignedPreallocated",\
	'' every ::2 using ($3/32768):8:18 with yerrorbars linetype 4 notitle,\
	# '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::2 using ($3/32768):8 with linespoints title "NaiveInteger, $mr\\hat{\\sigma}=$ ".naiveinteger_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveinteger_avg_stddev_rank
set yrange [0:1.45e6]
set output 'PrecomputedRankBlockSize_Select_L1CacheMiss.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::2 using ($3/32768):8 with linespoints linetype 1 title "Naive",\
	'' every ::2 using ($3/32768):8:18 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):8 with linespoints linetype 2 title "Preallocated",\
	'' every ::2 using ($3/32768):8:18 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::2 using ($3/32768):8 with linespoints linetype 3 title "UnalignedNaive",\
	'' every ::2 using ($3/32768):8:18 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):8 with linespoints linetype 4 title "UnalignedPreallocated",\
	'' every ::2 using ($3/32768):8:18 with yerrorbars linetype 4 notitle,\



# LEVEL 2 CACHE MISS RATE
set xlabel "Block Size (number of pages)"
set ylabel "Cache Miss Rate"
set yrange [0:0.5]
set output 'PrecomputedRankBlockSize_Rank_L2CacheMissRate.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::2 using ($3/32768):($9/($9+$10)) with linespoints linetype 1 title "Naive",\
	'' every ::2 using ($3/32768):($9/($9+$10)):($19/($9+$10)) with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):($9/($9+$10)) with linespoints linetype 2 title "Preallocated",\
	'' every ::2 using ($3/32768):($9/($9+$10)):($19/($9+$10)) with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::2 using ($3/32768):($9/($9+$10)) with linespoints linetype 3 title "UnalignedNaive",\
	'' every ::2 using ($3/32768):($9/($9+$10)):($19/($9+$10)) with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):($9/($9+$10)) with linespoints linetype 4 title "UnalignedPreallocated",\
	'' every ::2 using ($3/32768):($9/($9+$10)):($19/($9+$10)) with yerrorbars linetype 4 notitle,\
	# '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::2 using ($3/32768):($9/($9+$10)) with linespoints title "NaiveInteger, $mr\\hat{\\sigma}=$ ".naiveinteger_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveinteger_avg_stddev_rank
set yrange [0:*]
set output 'PrecomputedRankBlockSize_Select_L2CacheMissRate.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::2 using ($3/32768):($9/($9+$10)) with linespoints linetype 1 title "Naive",\
	'' every ::2 using ($3/32768):($9/($9+$10)):($19/($9+$10)) with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):($9/($9+$10)) with linespoints linetype 2 title "Preallocated",\
	'' every ::2 using ($3/32768):($9/($9+$10)):($19/($9+$10)) with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::2 using ($3/32768):($9/($9+$10)) with linespoints linetype 3 title "UnalignedNaive",\
	'' every ::2 using ($3/32768):($9/($9+$10)):($19/($9+$10)) with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):($9/($9+$10)) with linespoints linetype 4 title "UnalignedPreallocated",\
	'' every ::2 using ($3/32768):($9/($9+$10)):($19/($9+$10)) with yerrorbars linetype 4 notitle,\




# LEVEL 2 CACHE MISSES
set xlabel "Block Size (number of pages)"
set ylabel "Cache Misses"
set yrange [0:260000]
set output 'PrecomputedRankBlockSize_Rank_L2CacheMiss.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::2 using ($3/32768):9 with linespoints linetype 1 title "Naive",\
	'' every ::2 using ($3/32768):9:19 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):9 with linespoints linetype 2 title "Preallocated",\
	'' every ::2 using ($3/32768):9:19 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::2 using ($3/32768):9 with linespoints linetype 3 title "UnalignedNaive",\
	'' every ::2 using ($3/32768):9:19 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):9 with linespoints linetype 4 title "UnalignedPreallocated",\
	'' every ::2 using ($3/32768):9:19 with yerrorbars linetype 4 notitle,\
	# '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::2 using ($3/32768):9 with linespoints title "NaiveInteger, $mr\\hat{\\sigma}=$ ".naiveinteger_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveinteger_avg_stddev_rank
set yrange [0:*]
set output 'PrecomputedRankBlockSize_Select_L2CacheMiss.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::2 using ($3/32768):9 with linespoints linetype 1 title "Naive",\
	'' every ::2 using ($3/32768):9:19 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):9 with linespoints linetype 2 title "Preallocated",\
	'' every ::2 using ($3/32768):9:19 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::2 using ($3/32768):9 with linespoints linetype 3 title "UnalignedNaive",\
	'' every ::2 using ($3/32768):9:19 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):9 with linespoints linetype 4 title "UnalignedPreallocated",\
	'' every ::2 using ($3/32768):9:19 with yerrorbars linetype 4 notitle,\



# LEVEL 2 CACHE HiITS
set xlabel "Block Size (number of pages)"
set ylabel "Cache Hits"
set yrange [0:*]
set output 'PrecomputedRankBlockSize_Rank_L2CacheHits.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::2 using ($3/32768):10 with linespoints linetype 1 title "Naive",\
	'' every ::2 using ($3/32768):10:20 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):10 with linespoints linetype 2 title "Preallocated",\
	'' every ::2 using ($3/32768):10:20 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::2 using ($3/32768):10 with linespoints linetype 3 title "UnalignedNaive",\
	'' every ::2 using ($3/32768):10:20 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):10 with linespoints linetype 4 title "UnalignedPreallocated",\
	'' every ::2 using ($3/32768):10:20 with yerrorbars linetype 4 notitle,\
	# '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::2 using ($3/32768):10 with linespoints title "NaiveInteger, $mr\\hat{\\sigma}=$ ".naiveinteger_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveinteger_avg_stddev_rank
set yrange [0:1.25e6]
set output 'PrecomputedRankBlockSize_Select_L2CacheHits.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::2 using ($3/32768):10 with linespoints linetype 1 title "Naive",\
	'' every ::2 using ($3/32768):10:20 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):10 with linespoints linetype 2 title "Preallocated",\
	'' every ::2 using ($3/32768):10:20 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::2 using ($3/32768):10 with linespoints linetype 3 title "UnalignedNaive",\
	'' every ::2 using ($3/32768):10:20 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):10 with linespoints linetype 4 title "UnalignedPreallocated",\
	'' every ::2 using ($3/32768):10:20 with yerrorbars linetype 4 notitle,\



# LEVEL 3 CACHE MISSES
set xlabel "Block Size (number of pages)"
set ylabel "Cache Misses"
set yrange [0:165000]
set output 'PrecomputedRankBlockSize_Rank_L3CacheMiss.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Rank.data' every ::2 using ($3/32768):11 with linespoints linetype 1 title "Naive",\
	'' every ::2 using ($3/32768):11:21 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):11 with linespoints linetype 2 title "Preallocated",\
	'' every ::2 using ($3/32768):11:21 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Rank.data' every ::2 using ($3/32768):11 with linespoints linetype 3 title "UnalignedNaive",\
	'' every ::2 using ($3/32768):11:21 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Rank.data' every ::2 using ($3/32768):11 with linespoints linetype 4 title "UnalignedPreallocated",\
	'' every ::2 using ($3/32768):11:21 with yerrorbars linetype 4 notitle,\
	# '../Data/PrecomputedRankBlockSize_NaiveInteger_Rank.data' every ::2 using ($3/32768):11 with linespoints title "NaiveInteger, $mr\\hat{\\sigma}=$ ".naiveinteger_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveinteger_avg_stddev_rank
set yrange [0:200000]
set output 'PrecomputedRankBlockSize_Select_L3CacheMiss.tex'
plot '../Data/PrecomputedRankBlockSize_NaivePrecomputed_Select.data' every ::2 using ($3/32768):11 with linespoints linetype 1 title "Naive",\
	'' every ::2 using ($3/32768):11:21 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSize_PreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):11 with linespoints linetype 2 title "Preallocated",\
	'' every ::2 using ($3/32768):11:21 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedNaivePrecomputed_Select.data' every ::2 using ($3/32768):11 with linespoints linetype 3 title "UnalignedNaive",\
	'' every ::2 using ($3/32768):11:21 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSize_UnalignedPreallocatedPrecomputed_Select.data' every ::2 using ($3/32768):11 with linespoints linetype 4 title "UnalignedPreallocated",\
	'' every ::2 using ($3/32768):11:21 with yerrorbars linetype 4 notitle,\



#COMPARING WITH NAIVEINTEGER
# set xtics ("Rank" 0, "Select" 3)
# set ytics auto
set yrange [0:*]
set boxwidth 2.0
set style fill solid
unset xlabel
set ylabel "Walltime (seconds)"
unset xtics
set key top right vertical
set output 'PrecomputedRankBlockSize_vsNaiveInteger_Rank.tex'
plot '../Data/PrecomputedRankBlockSize_vsNaiveInteger.data' every 4::0 using 1:($2/1000000) title "NaiveInteger" with boxes,\
     '../Data/PrecomputedRankBlockSize_vsNaiveInteger.data' every 4::2 using 1:($2/1000000) title "UnalignedNaive" with boxes

set output 'PrecomputedRankBlockSize_vsNaiveInteger_Select.tex'
plot '../Data/PrecomputedRankBlockSize_vsNaiveInteger.data' every 4::1 using 1:($2/1000000) title "NaiveInteger" with boxes,\
     '../Data/PrecomputedRankBlockSize_vsNaiveInteger.data' every 4::3 using 1:($2/1000000) title "UnalignedNaive" with boxes



# WALL TIME for larger block size range
set xtics
set xlabel "Block Size (bits)"
set ylabel "Wall Time ($\\mu s$)"
set yrange [*:*]
set logscale x 2
set logscale y 10
set format x "$2^{%L}$"
set output 'PrecomputedRankBlockSizeLarger_Rank_WallTime.tex'
plot '../Data/PrecomputedRankBlockSizeLarger_NaivePrecomputed_Rank.data' every ::2 using 3:2 with linespoints linetype 1 title "Naive",\
	'' every ::2 using 3:2:13 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSizeLarger_PreallocatedPrecomputed_Rank.data' every ::2 using 3:2 with linespoints linetype 2 title "Preallocated",\
	'' every ::2 using 3:2:13 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSizeLarger_UnalignedNaivePrecomputed_Rank.data' every ::2 using 3:2 with linespoints linetype 3 title "UnalignedNaive",\
	'' every ::2 using 3:2:13 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSizeLarger_UnalignedPreallocatedPrecomputed_Rank.data' every ::2 using 3:2 with linespoints linetype 4 title "UnalignedPreallocated",\
	'' every ::2 using 3:2:13 with yerrorbars linetype 4 notitle,\
	
	# '../Data/PrecomputedRankBlockSizeLarger_NaiveInteger_Rank.data' every ::2 using 3:($2/100) with linespoints title "NaiveInteger, $mr\\hat{\\sigma}=$ ".naiveinteger_max_stddev_rank." $avg\\hat{\\sigma}=$ ".naiveinteger_avg_stddev_rank
set output 'PrecomputedRankBlockSizeLarger_Select_WallTime.tex'
plot '../Data/PrecomputedRankBlockSizeLarger_NaivePrecomputed_Select.data' every ::2 using 3:2 with linespoints linetype 1 title "Naive",\
	'' every ::2 using 3:2:13 with yerrorbars linetype 1 notitle,\
	'../Data/PrecomputedRankBlockSizeLarger_PreallocatedPrecomputed_Select.data' every ::2 using 3:2 with linespoints linetype 2 title "Preallocated",\
	'' every ::2 using 3:2:13 with yerrorbars linetype 2 notitle,\
	'../Data/PrecomputedRankBlockSizeLarger_UnalignedNaivePrecomputed_Select.data' every ::2 using 3:2 with linespoints linetype 3 title "UnalignedNaive",\
	'' every ::2 using 3:2:13 with yerrorbars linetype 3 notitle,\
	'../Data/PrecomputedRankBlockSizeLarger_UnalignedPreallocatedPrecomputed_Select.data' every ::2 using 3:2 with linespoints linetype 4 title "UnalignedPreallocated",\
	'' every ::2 using 3:2:13 with yerrorbars linetype 4 notitle,\