#!/usr/bin/gnuplot

set key outside top horizontal spacing 2
set term epslatex size 5.2,3.1 color
set border

#max
stats '../Data/NaiveIntegerAlphabetsize.data' every ::::0 using 2 nooutput
stddev = sprintf("%g",STATS_min)
#avg
stats '../Data/NaiveIntegerAlphabetsize.data' every ::::1 using 2 nooutput
stddev1 = sprintf("%g",STATS_min)

set logscale x 2
set format x "$2^{%L}$"
set xlabel "Alphabet Size \\small (log scale)"
set ylabel "Wall Time (microsec)"
set yrange [0:*]
# set key spacing 2
set output 'naiveIntegerAlphabetSize_WallTime.tex'
plot '../Data/NaiveIntegerAlphabetsize.data' every ::2 using 1:($2/log($1)) with linespoints title "\\large $\\frac{Wall Time}{log(\\sigma)}$".", $mr\\hat{\\sigma}=$".stddev." $avg\\hat{\\sigma}=$".stddev1
# set key default

#max 
unset logscale x
stats '../Data/NaiveIntegerAlphabetsize.data' every ::::0 using 2 nooutput
stddev = sprintf("%g",STATS_min)
stats '../Data/NaiveIntegerAlphabetsize.data' every ::::0 using 4 nooutput
stddev1 = sprintf("%g",STATS_min)
#avg
stats '../Data/NaiveIntegerAlphabetsize.data' every ::::1 using 2 nooutput
stddev2 = sprintf("%g",STATS_min)
stats '../Data/NaiveIntegerAlphabetsize.data' every ::::1 using 4 nooutput
stddev3 = sprintf("%g",STATS_min)
set key outside top horizontal spacing 1
set logscale x 2
set y2tics
set y2label 'Branch Misses'
set y2range [0:3e+6*100]
set ytics nomirror
set output 'naiveIntegerAlphabetSize_WallTime_BM.tex'
plot '../Data/NaiveIntegerAlphabetsize.data' every ::2 using 1:2 with linespoints title "Wall Time".", $mr\\hat{\\sigma}=$".stddev." $avg\\hat{\\sigma}=$".stddev2, \
	'../Data/NaiveIntegerAlphabetsize.data' every ::2 using 1:($4/100) with linespoints title "Branch Miss".", $mr\\hat{\\sigma}=$".stddev1." $avg\\hat{\\sigma}=$".stddev3
set ytics mirror
unset y2range
unset y2label
unset y2tics

#max
unset logscale x
stats '../Data/naiveIntegerAlphabetSize_smallN.data' every ::::0 using 2 nooutput
stddev = sprintf("%g",STATS_min)
#avg
stats '../Data/naiveIntegerAlphabetSize_smallN.data' every ::::1 using 2 nooutput
stddev1 = sprintf("%g",STATS_min)
set logscale x 2
set ylabel "Wall Time (microsec)"
set yrange [*:*]
set logscale y
set output 'naiveIntegerAlphabetSize_WallTime_plusSigma.tex'
plot '../Data/naiveIntegerAlphabetSize_smallN.data' every ::2 using 1:($2/(log($1) + $1)) with linespoints title "\\large $\\frac{Wall Time}{log(\\sigma) + \\sigma}$".", $mr\\hat{\\sigma}=$".stddev." $avg\\hat{\\sigma}=$".stddev1
unset logscale y


#max
unset logscale x
stats '../Data/NaiveIntegerAlphabetsize.data' every ::::0 using 3 nooutput
stddev = sprintf("%g",STATS_min)
#avg
stats '../Data/NaiveIntegerAlphabetsize.data' every ::::1 using 3 nooutput
stddev1 = sprintf("%g",STATS_min)
set logscale x 2
set ylabel "Amount"
set yrange [0:0.1]
set output 'naiveIntegerAlphabetSize_BMRate.tex'
plot '../Data/NaiveIntegerAlphabetsize.data' every ::2 using 1:3 with linespoints title "Branch Miss Rate".", $mr\\hat{\\sigma}=$".stddev." $avg\\hat{\\sigma}=$".stddev1
set yrange [*:*]

#max
unset logscale x
stats '../Data/NaiveIntegerAlphabetsize.data' every ::::0 using 6 nooutput
stddev = sprintf("%g",STATS_min)
stats '../Data/NaiveIntegerAlphabetsize.data' every ::::0 using 7 nooutput
stddev1 = sprintf("%g",STATS_min)
stats '../Data/NaiveIntegerAlphabetsize.data' every ::::0 using 8 nooutput
stddev2 = sprintf("%g",STATS_min)
#avg
stats '../Data/NaiveIntegerAlphabetsize.data' every ::::1 using 6 nooutput
stddev3 = sprintf("%g",STATS_min)
stats '../Data/NaiveIntegerAlphabetsize.data' every ::::1 using 7 nooutput
stddev4 = sprintf("%g",STATS_min)
stats '../Data/NaiveIntegerAlphabetsize.data' every ::::1 using 8 nooutput
stddev5 = sprintf("%g",STATS_min)
set logscale x 2
set key outside top horizontal spacing 1.5
set output 'naiveIntegerAlphabetSize_CM.tex'
plot '../Data/NaiveIntegerAlphabetsize.data' every ::2 using 1:6 with linespoints title "L1 CM".", $mr\\hat{\\sigma}=$".stddev." $avg\\hat{\\sigma}=$".stddev3, \
	'../Data/NaiveIntegerAlphabetsize.data' every ::2 using 1:7 with linespoints title "L2 CM".", $mr\\hat{\\sigma}=$".stddev1." $avg\\hat{\\sigma}=$".stddev4, \
	'../Data/NaiveIntegerAlphabetsize.data' every ::2 using 1:8 with linespoints title "L3 CM".", $mr\\hat{\\sigma}=$".stddev2." $avg\\hat{\\sigma}=$".stddev5
# set key default


#max
unset logscale x
stats '../Data/NaiveIntegerAlphabetsize.data' every ::::0 using 2 nooutput
stddev = sprintf("%g",STATS_min)
stats '../Data/NaiveIntegerAlphabetsize.data' every ::::0 using 5 nooutput
stddev1 = sprintf("%g",STATS_min)
#avg
stats '../Data/NaiveIntegerAlphabetsize.data' every ::::0 using 2 nooutput
stddev2 = sprintf("%g",STATS_min)
stats '../Data/NaiveIntegerAlphabetsize.data' every ::::0 using 5 nooutput
stddev3 = sprintf("%g",STATS_min)
set logscale x 2
set ylabel "Wall Time (microsec)"
set yrange [0:*]
set y2tics
set y2label 'TLB Misses'
set y2range [0:*]
set ytics nomirror
set key outside top horizontal spacing 2 box
set output 'naiveIntegerAlphabetSize_WallTime_TLB.tex'
plot '../Data/NaiveIntegerAlphabetsize.data' every ::2 using 1:($2/log($1)) with linespoints title "\\large $\\frac{Wall Time}{log(\\sigma)}$".", $mr\\hat{\\sigma}=$".stddev." $avg\\hat{\\sigma}=$".stddev2, \
	'../Data/NaiveIntegerAlphabetsize.data' every ::2 using 1:($5/log($1)) with linespoints title "\\large $\\frac{TLB Miss}{log(\\sigma)}$".", $mr\\hat{\\sigma}=$".stddev1." $avg\\hat{\\sigma}=$".stddev3
set key outside top horizontal
set ytics mirror
unset y2label
unset y2tics