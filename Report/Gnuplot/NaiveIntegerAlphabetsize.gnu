#!/usr/bin/gnuplot

set term epslatex color



set logscale x 2
# set logscale y

set xlabel "Alphabet Size \\small (log scale)"
set ylabel "Wall Time (microsec)"
set output 'naiveIntegerAlphabetSize_WallTime.tex'
plot '../Data/NaiveIntegerAlphabetsize.data' using 1:2 with linespoints title "Wall Time", \

set xlabel "Alphabet Size \\small (log scale)"
set ylabel "Amount"
set output 'naiveIntegerAlphabetSize_BM.tex'
plot '../Data/NaiveIntegerAlphabetsize.data' using 1:3 with linespoints title "Branch Miss", \

set output 'naiveIntegerAlphabetSize_TLB_CM.tex'
plot '../Data/NaiveIntegerAlphabetsize.data' using 1:4 with linespoints title "TLB Miss", \
	'../Data/NaiveIntegerAlphabetsize.data' using 1:5 with linespoints title "L1 CM", \
	'../Data/NaiveIntegerAlphabetsize.data' using 1:6 with linespoints title "L2 CM", \
	'../Data/NaiveIntegerAlphabetsize.data' using 1:7 with linespoints title "L3 CM"