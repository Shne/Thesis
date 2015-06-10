#!/usr/bin/gnuplot
set key top horizontal
set term epslatex size 2.8,2.5 color font "" 6.5


# set ytics auto

set boxwidth 1.0
# set style fill solid
set style fill solid 1.00 border 0
set style histogram errorbars gap 1.0
set style data histogram
set bars 2
unset xlabel
unset xtics

set yrange [0:*]
set xrange [-0.5:0.5]


# Build Walltime
set yrange [0:18]
set ylabel 'Walltime (seconds)'
set key top left vertical
set output 'CumulativeSumBuildWalltime.tex'
plot '../Data/CumulativeSum.data' every 9    using ($2/1000000):($13/1000000) title "UnalignedNaive" ls 1,\
     '../Data/CumulativeSum.data' every 9::3 using ($2/1000000):($13/1000000) title "CumulativeSum" ls 2


# Build Memory Usage
set yrange [0:*]
set ylabel 'Memory Usage (MB)'
set key top left vertical
set output 'CumulativeSumBuildMemory.tex'
plot '../Data/CumulativeSum_memory_massif.data' every 2    using ($1/1048576):($2/1048576) title "UnalignedNaive" ls 1,\
     '../Data/CumulativeSum_memory_massif.data' every 2::1 using ($1/1048576):($2/1048576) title "CumulativeSum" ls 2


set term epslatex size 2.1,2.5 color font "" 6.5


# Rank Walltime
set yrange [0:*]
set ylabel 'Walltime (milliseconds)'
set output 'CumulativeSumRankWalltime.tex'
plot '../Data/CumulativeSum.data' every 9::1 using ($2/1000):($13/1000) title "UnalignedNaive" ls 1,\
     '../Data/CumulativeSum.data' every 9::4 using ($2/1000):($13/1000) title "CumulativeSum" ls 2

# Rank BranchMiss
set yrange [0:46000]
set ylabel 'Branch Mispredictions'
set output 'CumulativeSumRankBranchMiss.tex'
plot '../Data/CumulativeSum.data' every 9::1 using ($3):($14) title "UnalignedNaive" ls 1,\
     '../Data/CumulativeSum.data' every 9::4 using ($3):($14) title "CumulativeSum" ls 2


# Rank BranchExe
set yrange [0:2.7e+6]
set ylabel 'Branches Executed'
set output 'CumulativeSumRankBranchExe.tex'
plot '../Data/CumulativeSum.data' every 9::1 using ($4):($15) title "UnalignedNaive" ls 1,\
     '../Data/CumulativeSum.data' every 9::4 using ($4):($15) title "CumulativeSum" ls 2

# Rank BranchMissRate
set yrange [0:0.13]
set ylabel 'Branch Misprediction Rate'
set output 'CumulativeSumRankBranchMissRate.tex'
plot '../Data/CumulativeSum.data' every 9::1 using ($5):($16) title "UnalignedNaive" ls 1,\
     '../Data/CumulativeSum.data' every 9::4 using ($5):($16) title "CumulativeSum" ls 2


# Rank TLB Miss
set yrange [0:7000]
set ylabel 'TLB Misses'
set output 'CumulativeSumRankTLBMiss.tex'
plot '../Data/CumulativeSum.data' every 9::1 using ($6):($17) title "UnalignedNaive" ls 1,\
     '../Data/CumulativeSum.data' every 9::4 using ($6):($17) title "CumulativeSum" ls 2


# Rank Lvl 1 CM
set yrange [0:*]
set ylabel 'Cache Misses'
set output 'CumulativeSumRankL1CM.tex'
plot '../Data/CumulativeSum.data' every 9::1 using ($7):($18) title "UnalignedNaive" ls 1,\
     '../Data/CumulativeSum.data' every 9::4 using ($7):($18) title "CumulativeSum" ls 2

# Rank Lvl 2 CM
set yrange [0:190000]
set ylabel 'Cache Misses'
set output 'CumulativeSumRankL2CM.tex'
plot '../Data/CumulativeSum.data' every 9::1 using ($8):($19) title "UnalignedNaive" ls 1,\
     '../Data/CumulativeSum.data' every 9::4 using ($8):($19) title "CumulativeSum" ls 2


# Rank Lvl 2 CHits
set yrange [0:265000]
set ylabel 'Cache Hits'
set output 'CumulativeSumRankL2CHits.tex'
plot '../Data/CumulativeSum.data' every 9::1 using ($9):($20) title "UnalignedNaive" ls 1,\
     '../Data/CumulativeSum.data' every 9::4 using ($9):($20) title "CumulativeSum" ls 2


# Rank Lvl 2 CM Rate
set yrange [0:2.0]
set ylabel 'Cache Miss Rate'
set output 'CumulativeSumRankL2CMRate.tex'
plot '../Data/CumulativeSum.data' every 9::1 using ($10):($21) title "UnalignedNaive" ls 1,\
     '../Data/CumulativeSum.data' every 9::4 using ($10):($21) title "CumulativeSum" ls 2


# Rank Lvl 3 CM
set yrange [0:150000]
set ylabel 'Cache Misses'
set output 'CumulativeSumRankL3CM.tex'
plot '../Data/CumulativeSum.data' every 9::1 using ($11):($22) title "UnalignedNaive" ls 1,\
     '../Data/CumulativeSum.data' every 9::4 using ($11):($22) title "CumulativeSum" ls 2














##############
### SELECT ###
##############
# Select Walltime
set yrange [0:14]
set ylabel 'Walltime (milliseconds)'
set key top right horizontal
set output 'CumulativeSumSelectWalltime.tex'
plot '../Data/CumulativeSum.data' every 9::2 using ($2/1000):($13/1000) title "UnalignedNaive" ls 1,\
     '../Data/CumulativeSum.data' every 9::5 using ($2/1000):($13/1000) title "CumulativeSum" ls 2,\
     '../Data/CumulativeSum.data' every 9::6 using ($2/1000):($13/1000) title "CmSumBranchless" ls 3

# Select BranchMiss
set yrange [0:450000]
set ylabel 'Branch Mispredictions'
set output 'CumulativeSumSelectBranchMiss.tex'
plot '../Data/CumulativeSum.data' every 9::2 using ($3):($14) title "UnalignedNaive" ls 1,\
     '../Data/CumulativeSum.data' every 9::5 using ($3):($14) title "CumulativeSum" ls 2,\
     '../Data/CumulativeSum.data' every 9::6 using ($3):($14) title "CmSumBranchless" ls 3


# Select BranchExe
set yrange [0:1.5e+7]
set ylabel 'Branches Executed'
set output 'CumulativeSumSelectBranchExe.tex'
plot '../Data/CumulativeSum.data' every 9::2 using ($4):($15) title "UnalignedNaive" ls 1,\
     '../Data/CumulativeSum.data' every 9::5 using ($4):($15) title "CumulativeSum" ls 2,\
     '../Data/CumulativeSum.data' every 9::6 using ($4):($15) title "CmSumBranchless" ls 3

# Select BranchMissRate
set yrange [0:0.2]
set ylabel 'Branch Misprediction Rate'
set output 'CumulativeSumSelectBranchMissRate.tex'
plot '../Data/CumulativeSum.data' every 9::2 using ($5):($16) title "UnalignedNaive" ls 1,\
     '../Data/CumulativeSum.data' every 9::5 using ($5):($16) title "CumulativeSum" ls 2,\
     '../Data/CumulativeSum.data' every 9::6 using ($5):($16) title "CmSumBranchless" ls 3


# Select TLB Miss
set yrange [0:10800]
set ylabel 'TLB Misses'
set output 'CumulativeSumSelectTLBMiss.tex'
plot '../Data/CumulativeSum.data' every 9::2 using ($6):($17) title "UnalignedNaive" ls 1,\
     '../Data/CumulativeSum.data' every 9::5 using ($6):($17) title "CumulativeSum" ls 2,\
     '../Data/CumulativeSum.data' every 9::6 using ($6):($17) title "CmSumBranchless" ls 3


# Select Lvl 1 CM
set yrange [0:480000]
set ylabel 'Cache Misses'
set output 'CumulativeSumSelectL1CM.tex'
plot '../Data/CumulativeSum.data' every 9::2 using ($7):($18) title "UnalignedNaive" ls 1,\
     '../Data/CumulativeSum.data' every 9::5 using ($7):($18) title "CumulativeSum" ls 2,\
     '../Data/CumulativeSum.data' every 9::6 using ($7):($18) title "CmSumBranchless" ls 3

# Select Lvl 2 CM
set yrange [0:260000]
set ylabel 'Cache Misses'
set output 'CumulativeSumSelectL2CM.tex'
plot '../Data/CumulativeSum.data' every 9::2 using ($8):($19) title "UnalignedNaive" ls 1,\
     '../Data/CumulativeSum.data' every 9::5 using ($8):($19) title "CumulativeSum" ls 2,\
     '../Data/CumulativeSum.data' every 9::6 using ($8):($19) title "CmSumBranchless" ls 3


# Select Lvl 2 CHits
set yrange [0:300000]
set ylabel 'Cache Hits'
set output 'CumulativeSumSelectL2CHits.tex'
plot '../Data/CumulativeSum.data' every 9::2 using ($9):($20) title "UnalignedNaive" ls 1,\
     '../Data/CumulativeSum.data' every 9::5 using ($9):($20) title "CumulativeSum" ls 2,\
     '../Data/CumulativeSum.data' every 9::6 using ($9):($20) title "CmSumBranchless" ls 3


# Select Lvl 2 CM Rate
set yrange [0:1.6]
set ylabel 'Cache Miss Rate'
set output 'CumulativeSumSelectL2CMRate.tex'
plot '../Data/CumulativeSum.data' every 9::2 using ($10):($21) title "UnalignedNaive" ls 1,\
     '../Data/CumulativeSum.data' every 9::5 using ($10):($21) title "CumulativeSum" ls 2,\
     '../Data/CumulativeSum.data' every 9::6 using ($10):($21) title "CmSumBranchless" ls 3


# Select Lvl 3 CM
set yrange [0:240000]
set ylabel 'Cache Misses'
set output 'CumulativeSumSelectL3CM.tex'
plot '../Data/CumulativeSum.data' every 9::2 using ($11):($22) title "UnalignedNaive" ls 1,\
     '../Data/CumulativeSum.data' every 9::5 using ($11):($22) title "CumulativeSum" ls 2,\
     '../Data/CumulativeSum.data' every 9::6 using ($11):($22) title "CmSumBranchless" ls 3
