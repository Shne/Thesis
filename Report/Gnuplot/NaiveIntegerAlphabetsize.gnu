#!/usr/bin/gnuplot

set term epslatex color



set logscale x 2
set format x "$2^{%L}$"

set xlabel "Alphabet Size \\small (log scale)"
set ylabel "Wall Time (microsec)"
set yrange [0:*]
set output 'naiveIntegerAlphabetSize_WallTime_BM_TLB.tex'
plot '../Data/NaiveIntegerAlphabetsize.data' using 1:2 with linespoints title "Wall Time", \
	'../Data/NaiveIntegerAlphabetsize.data' using 1:($4/100) with linespoints title "Branch Miss (x100)", \
	'../Data/NaiveIntegerAlphabetsize.data' using 1:($5) with linespoints title "TLB Miss", \

# set xlabel "Alphabet Size \\small (log scale)"
# set ylabel "Amount"
# set output 'naiveIntegerAlphabetSize_BM.tex'
# plot '../Data/NaiveIntegerAlphabetsize.data' using 1:3 with linespoints title "Branch Miss", \

set xlabel "Alphabet Size \\small (log scale)"
set ylabel "Wall Time (microsec)"
set output 'naiveIntegerAlphabetSize_WallTime_plusSigma.tex'
set key width 100
plot '../Data/naiveIntegerAlphabetSize_smallN.data' using 1:($2/(log($1) + $1)) with linespoints title "$ \\frac{Wall Time}{log(\\sigma) + \\sigma}$", \

set xlabel "Alphabet Size \\small (log scale)"
set ylabel "Amount"
set yrange [0:0.1]
set output 'naiveIntegerAlphabetSize_BMRate.tex'
plot '../Data/NaiveIntegerAlphabetsize.data' using 1:3 with linespoints title "Branch Miss Rate", \

set yrange [*:*]
set output 'naiveIntegerAlphabetSize_CM.tex'
plot '../Data/NaiveIntegerAlphabetsize.data' using 1:6 with linespoints title "L1 CM", \
	'../Data/NaiveIntegerAlphabetsize.data' using 1:7 with linespoints title "L2 CM", \
	'../Data/NaiveIntegerAlphabetsize.data' using 1:8 with linespoints title "L3 CM"