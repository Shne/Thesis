#!/usr/bin/gnuplot

set term epslatex size 5.5,3.3 color



set logscale x 2
set format x "$2^{%L}$"

set xlabel "Alphabet Size \\small (log scale)"
set ylabel "Wall Time (microsec)"
set yrange [0:*]
set key spacing 2
set output 'naiveIntegerAlphabetSize_WallTime.tex'
plot '../Data/NaiveIntegerAlphabetsize.data' using 1:($2/(10000000*log($1))) with linespoints title "\\large $\\frac{Wall Time}{10^7 \\cdot log(\\sigma)}$"
set key default

set y2tics
set y2label 'Branch Misses'
set y2range [0:3e+6*100]
set output 'naiveIntegerAlphabetSize_WallTime_BM.tex'
plot '../Data/NaiveIntegerAlphabetsize.data' using 1:2 with linespoints title "Wall Time", \
	'../Data/NaiveIntegerAlphabetsize.data' using 1:($4/100) with linespoints title "Branch Miss"
unset y2range
unset y2label
unset y2tics




# set xlabel "Alphabet Size \\small (log scale)"
# set ylabel "Amount"
# set output 'naiveIntegerAlphabetSize_BM.tex'
# plot '../Data/NaiveIntegerAlphabetsize.data' using 1:3 with linespoints title "Branch Miss", \

set xlabel "Alphabet Size \\small (log scale)"
set ylabel "Wall Time (microsec)"
set key spacing 2
set output 'naiveIntegerAlphabetSize_WallTime_plusSigma.tex'
plot '../Data/naiveIntegerAlphabetSize_smallN.data' using 1:($2/(log($1) + $1)) with linespoints title "\\large $\\frac{Wall Time}{log(\\sigma) + \\sigma}$"
set key default

set xlabel "Alphabet Size \\small (log scale)"
set ylabel "Amount"
set yrange [0:0.1]
set output 'naiveIntegerAlphabetSize_BMRate.tex'
plot '../Data/NaiveIntegerAlphabetsize.data' using 1:3 with linespoints title "Branch Miss Rate"
set yrange [*:*]

set key right center
set output 'naiveIntegerAlphabetSize_CM.tex'
plot '../Data/NaiveIntegerAlphabetsize.data' using 1:6 with linespoints title "L1 CM", \
	'../Data/NaiveIntegerAlphabetsize.data' using 1:7 with linespoints title "L2 CM", \
	'../Data/NaiveIntegerAlphabetsize.data' using 1:8 with linespoints title "L3 CM"
set key default

set ylabel "Wall Time (microsec)"
set yrange [0:*]
set y2tics
set y2label 'TLB Misses'
set y2range [0:*]
set key spacing 2
set output 'naiveIntegerAlphabetSize_WallTime_TLB.tex'
plot '../Data/NaiveIntegerAlphabetsize.data' using 1:($2/(10000000*log($1))) with linespoints title "\\large $\\frac{Wall Time}{10^7 \\cdot log(\\sigma)}$", \
	'../Data/NaiveIntegerAlphabetsize.data' using 1:($5/(10000000*log($1))) with linespoints title "\\large $\\frac{TLB Miss}{10^7 \\cdot log(\\sigma)}$"
set key default
unset y2label
unset y2tics