#!/usr/bin/gnuplot

set key top left horizontal
# set term epslatex size 6.5,4 color

# set term epslatex size 3.2,2.5 color font "" 6
# set border
# set logscale x 2

# WALL TIME
set xlabel "Skew Parameter"
set ylabel "Wall Time ($\\mu s$)"
set yrange [0:*]
set xrange [1.9:6.1]

#BUILD
set term epslatex size 2.8,2.5 color font "" 6
set output 'CumulativeSumSkew_n8as16_Build_WallTime.tex'
plot '../Data/CumulativeSumSkew_n8as16_Build.data' every ::2 using 1:2 with linespoints linetype 1 notitle,\
	'' every ::2 using 1:2:3 with yerrorbars linetype 1 notitle


#RANK
set term epslatex size 3.2,2.5 color font "" 6
set output 'CumulativeSumSkew_n8as16_Rank.tex'
plot '../Data/CumulativeSumSkew_n8as16_Rank.data' every ::2 using 1:2 with linespoints linetype 1 notitle,\
	'' every ::2 using 1:2:3 with yerrorbars linetype 1 notitle

set ylabel "Cache Misses"
set output 'CumulativeSumSkew_n8as16_Rank_CM.tex'
plot '../Data/CumulativeSumSkew_n8as16_Rank.data' every ::2 using 1:4 with linespoints linetype 1 title "Level 1",\
	'' every ::2 using 1:4:5 with yerrorbars linetype 1 notitle,\
	'../Data/CumulativeSumSkew_n8as16_Rank.data' every ::2 using 1:6 with linespoints linetype 2 title "Level 2",\
	'' every ::2 using 1:6:7 with yerrorbars linetype 2 notitle,\
	'../Data/CumulativeSumSkew_n8as16_Rank.data' every ::2 using 1:8 with linespoints linetype 3 title "Level 3",\
	'' every ::2 using 1:8:9 with yerrorbars linetype 3 notitle

set ylabel "Branch Mispredictions"
set output 'CumulativeSumSkew_n8as16_Rank_BM.tex'
set ytics nomirror
set yrange [0:10000]
set y2tics
set y2range [0:1]
set y2label "Branch Misprediction Rate"
plot '../Data/CumulativeSumSkew_n8as16_Rank.data' every ::2 using 1:10 with linespoints linetype 1 title "Branch Mispredictions",\
	'' every ::2 using 1:10:11 with yerrorbars linetype 1 notitle,\
	'../Data/CumulativeSumSkew_n8as16_Rank.data' every ::2 using 1:($14*10000) with linespoints linetype 2 title "Branch Misprediction Rate",\
	'' every ::2 using 1:($14*10000):($15*10000) with yerrorbars linetype 2 notitle
unset y2tics
unset y2label
set yrange [0:*]

# set yrange [0:0.1]
# set ylabel "Branch Misprediction Rate"
# set output 'CumulativeSumSkew_n8as16_Rank_BMRate.tex'
# plot '../Data/CumulativeSumSkew_n8as16_Rank.data' every ::2 using 1:14 with linespoints linetype 1 notitle,\
# 	'' every ::2 using 1:14:15 with yerrorbars linetype 1 notitle


set ylabel "Branches Executed"
set output 'CumulativeSumSkew_n8as16_Rank_BMExe.tex'
plot '../Data/CumulativeSumSkew_n8as16_Rank.data' every ::2 using 1:12 with linespoints linetype 1 notitle,\
	'' every ::2 using 1:12:13 with yerrorbars linetype 1 notitle

set ylabel "Translation Lookaside Buffer Misses"
set output 'CumulativeSumSkew_n8as16_Rank_TLBM.tex'
plot '../Data/CumulativeSumSkew_n8as16_Rank.data' every ::2 using 1:16 with linespoints linetype 1 notitle,\
	'' every ::2 using 1:16:17 with yerrorbars linetype 1 notitle


set ylabel "Hits"
set output 'CumulativeSumSkew_n8as16_Rank_L2CH.tex'
set ytics nomirror
set yrange [0:20000]
set y2tics
set y2range [0:(20000/20000)]
set y2label "Hit Rate"
plot '../Data/CumulativeSumSkew_n8as16_Rank.data' every ::2 using 1:18 with linespoints linetype 1 title "Hits",\
	'' every ::2 using 1:18:19 with yerrorbars linetype 1 notitle,\
	'../Data/CumulativeSumSkew_n8as16_Rank.data' every ::2 using 1:($20*20000) with linespoints linetype 2 title "Hit Rate",\
	'' every ::2 using 1:($20*20000):($21*20000) with yerrorbars linetype 2 notitle
unset y2tics
unset y2label
set yrange [0:*]

# set ylabel "Level 2 Data Cache Hit Rate"
# set output 'CumulativeSumSkew_n8as16_Rank_L2CHRate.tex'
# plot '../Data/CumulativeSumSkew_n8as16_Rank.data' every ::2 using 1:20 with linespoints linetype 1 notitle,\
# 	'' every ::2 using 1:20:21 with yerrorbars linetype 1 notitle



#SELECT
set yrange [0:*]
set ylabel "Wall Time ($\\mu s$)"
set output 'CumulativeSumSkew_n8as16_Select.tex'
plot '../Data/CumulativeSumSkew_n8as16_Select.data' every ::2 using 1:2 with linespoints linetype 1 notitle,\
	'' every ::2 using 1:2:3 with yerrorbars linetype 1 notitle

set ylabel "Cache Misses"
set output 'CumulativeSumSkew_n8as16_Select_CM.tex'
plot '../Data/CumulativeSumSkew_n8as16_Select.data' every ::2 using 1:4 with linespoints linetype 1 title "Level 1",\
	'' every ::2 using 1:4:5 with yerrorbars linetype 1 notitle,\
	'../Data/CumulativeSumSkew_n8as16_Select.data' every ::2 using 1:6 with linespoints linetype 2 title "Level 2",\
	'' every ::2 using 1:6:7 with yerrorbars linetype 2 notitle,\
	'../Data/CumulativeSumSkew_n8as16_Select.data' every ::2 using 1:8 with linespoints linetype 3 title "Level 3",\
	'' every ::2 using 1:8:9 with yerrorbars linetype 3 notitle

set ylabel "Branch Mispredictions"
set output 'CumulativeSumSkew_n8as16_Select_BM.tex'
set ytics nomirror
set yrange [0:500000]
set y2tics
set y2range [0:1]
set y2label "Branch Misprediction Rate"
plot '../Data/CumulativeSumSkew_n8as16_Select.data' every ::2 using 1:10 with linespoints linetype 1 title "Branch Mispredictions",\
	'' every ::2 using 1:10:11 with yerrorbars linetype 1 notitle,\
	'../Data/CumulativeSumSkew_n8as16_Select.data' every ::2 using 1:($14*500000) with linespoints linetype 2 title "Branch Misprediction Rate",\
	'' every ::2 using 1:($14*500000):($15*500000) with yerrorbars linetype 2 notitle
unset y2tics
unset y2label
set yrange [0:*]

set ylabel "Branches Executed"
set output 'CumulativeSumSkew_n8as16_Select_BMExe.tex'
plot '../Data/CumulativeSumSkew_n8as16_Select.data' every ::2 using 1:12 with linespoints linetype 1 notitle,\
	'' every ::2 using 1:12:13 with yerrorbars linetype 1 notitle

set ylabel "Translation Lookaside Buffer Misses"
set output 'CumulativeSumSkew_n8as16_Select_TLBM.tex'
plot '../Data/CumulativeSumSkew_n8as16_Select.data' every ::2 using 1:16 with linespoints linetype 1 notitle,\
	'' every ::2 using 1:16:17 with yerrorbars linetype 1 notitle


set ylabel "Hits"
set output 'CumulativeSumSkew_n8as16_Select_L2CH.tex'
set ytics nomirror
set y2tics
set yrange [0:70000]
set y2range [0:1]
set y2label "Hit Rate"
plot '../Data/CumulativeSumSkew_n8as16_Select.data' every ::2 using 1:18 with linespoints linetype 1 title "Hits",\
	'' every ::2 using 1:18:19 with yerrorbars linetype 1 notitle,\
	'../Data/CumulativeSumSkew_n8as16_Select.data' every ::2 using 1:($20*70000) with linespoints linetype 2 title "Hit Rate",\
	'' every ::2 using 1:($20*70000):($21*70000) with yerrorbars linetype 2 notitle
unset y2tics
unset y2label
set yrange [0:*]