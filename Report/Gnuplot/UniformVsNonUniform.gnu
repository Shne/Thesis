#!/usr/bin/gnuplot

set term epslatex size 1.9,2.5 color font "" 6.5


set boxwidth 1.0
# set style fill solid
set style fill solid 1.00 border 0
set style histogram errorbars gap 1.0
set style data histogram
set bars 2
unset xlabel
set ylabel "Walltime (seconds)"
unset xtics
set key top vertical

set yrange [0:*]
set xrange [-0.5:0.5]
# set yrange [0:12000000]
set output 'UniformVsNonUniform_Build_WallTime.tex'
plot '../Data/NaiveInteger_Build_NonUniform.data' using ($3/1000000):($14/1000000) title "Non-Uniform",\
     '../Data/NaiveInteger_Build_Uniform.data' using ($3/1000000):($14/1000000) title "Uniform"

set yrange [0:1.8]
set output 'UniformVsNonUniform_Rank_WallTime.tex'
plot '../Data/NaiveInteger_Rank_NonUniform.data' using ($3/1000000):($14/1000000) title "Non-Uniform",\
     '../Data/NaiveInteger_Rank_Uniform.data' using ($3/1000000):($14/1000000) title "Uniform"

set yrange [0:1.0]
set output 'UniformVsNonUniform_Select_WallTime.tex'
plot '../Data/NaiveInteger_Select_NonUniform.data' using ($3/1000000):($14/1000000) title "Non-Uniform",\
     '../Data/NaiveInteger_Select_Uniform.data' using ($3/1000000):($14/1000000) title "Uniform"







