#!/usr/bin/gnuplot

set key top horizontal spacing 2
set term epslatex size 3.2,2.5 color font "" 6
set border


set logscale x 2
set format x "$2^{%L}$"
set xlabel "Alphabet Size (log scale)"
set ylabel "$\\nicefrac{Wall Time}{log(\\sigma)}$"
set yrange [0:*]

set output 'naiveIntegerAlphabetSize_WallTime.tex'
plot '../Data/NaiveIntegerAlphabetsize.data' every ::2 using 1:($2/log($1)) with linespoints title "$\\frac{Wall Time}{log(\\sigma)}$"



set ylabel "Wall Time (microsec)"
set key top horizontal spacing 1
set y2tics
set y2label 'Branch Misses'
set y2range [0:3e+6*100]
set ytics nomirror
set output 'naiveIntegerAlphabetSize_WallTime_BM.tex'
plot '../Data/NaiveIntegerAlphabetsize.data' every ::2 using 1:2 with linespoints title "Wall Time",\
	'../Data/NaiveIntegerAlphabetsize.data' every ::2 using 1:($4/100) with linespoints title "Branch Miss"
set ytics mirror
unset y2range
unset y2label
unset y2tics


set ylabel "$\\nicefrac{Wall Time}{log(\\sigma) + \\sigma}$"
set yrange [*:*]
set logscale y
set key top right horizontal spacing 3
set output 'naiveIntegerAlphabetSize_WallTime_plusSigma.tex'
plot '../Data/naiveIntegerAlphabetSize_smallN.data' every ::2 using 1:($2/(log($1) + $1)) with linespoints title "$\\frac{Wall Time}{log(\\sigma) + \\sigma}$"
unset logscale y



set logscale x 2
set ylabel "Amount"
set yrange [0:0.1]
set output 'naiveIntegerAlphabetSize_BMRate.tex'
plot '../Data/NaiveIntegerAlphabetsize.data' every ::2 using 1:3 with linespoints title "Branch Miss Rate"
set yrange [*:*]


set key top left vertical Left
set output 'naiveIntegerAlphabetSize_CM.tex'
plot '../Data/NaiveIntegerAlphabetsize.data' every ::2 using 1:6 with linespoints title "L1 CM",\
	'../Data/NaiveIntegerAlphabetsize.data' every ::2 using 1:7 with linespoints title "L2 CM",\
	'../Data/NaiveIntegerAlphabetsize.data' every ::2 using 1:8 with linespoints title "L3 CM"



set ylabel "Wall Time (microsec)"
set yrange [0:*]
set y2tics
set y2label 'TLB Misses'
set y2range [0:*]
set ytics nomirror
set key top left vertical Right spacing 3
set output 'naiveIntegerAlphabetSize_WallTime_TLB.tex'
plot '../Data/NaiveIntegerAlphabetsize.data' every ::2 using 1:($2/log($1)) with linespoints title "$\\frac{Wall Time}{log(\\sigma)}$",\
	'../Data/NaiveIntegerAlphabetsize.data' every ::2 using 1:($5/log($1)) with linespoints title "$\\frac{TLB Miss}{log(\\sigma)}$"
set ytics mirror
unset y2label
unset y2tics