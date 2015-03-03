#!/usr/bin/gnuplot

set term epslatex color

set xlabel "Alphabet Size \\small (log scale)"
set ylabel "Wall Time (microsec)"

set logscale x
# set logscale y

set output 'naiveIntegerAlphabetSize_WallTime.tex'
plot 'Gnuplot/NaiveIntegerAlphabetsize.data' using 1:2 with linespoints title "Wall Time", \

set output 'naiveIntegerAlphabetSize_BM.tex'
plot 'Gnuplot/NaiveIntegerAlphabetsize.data' using 1:3 with linespoints title "Branch Miss", \

set output 'naiveIntegerAlphabetSize_TLB_CM.tex'
plot 'Gnuplot/NaiveIntegerAlphabetsize.data' using 1:4 with linespoints title "TLB Miss", \
	'Gnuplot/NaiveIntegerAlphabetsize.data' using 1:5 with linespoints title "L1 CM", \
	'Gnuplot/NaiveIntegerAlphabetsize.data' using 1:6 with linespoints title "L2 CM", \
	'Gnuplot/NaiveIntegerAlphabetsize.data' using 1:7 with linespoints title "L3 CM"