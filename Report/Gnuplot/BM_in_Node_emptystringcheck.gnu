#!/usr/bin/gnuplot

set term epslatex color

set logscale x 2

set xlabel "Alphabet Size \\small (log scale)"
set ylabel "Amount"
set output 'BM_in_Node_emptystringcheck.tex'
plot '../Data/BM_in_Node_emptystringcheck.data' using 1:2 with linespoints title "Branch Miss", \
