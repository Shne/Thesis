#!/usr/bin/gnuplot

set term epslatex size 3.2,2.5 color font "" 6


set boxwidth 0.5
set style fill solid
unset xlabel
set ylabel "Walltime (seconds)"
unset xtics
set key top right vertical

set yrange [0:120]
# set yrange [0:12000000]
set output 'UniformVsNonUniform_Build_WallTime.tex'
plot '../Data/NaiveInteger_Build_NonUniform.data' using 1:24 title "Non-Uniform" with boxes,\
     '../Data/NaiveInteger_Build_Uniform.data' using 1:24 title "Uniform" with boxes


set output 'UniformVsNonUniform_Select_WallTime.tex'
plot '../Data/NaiveInteger_Select_NonUniform.data' using 1:24 title "Non-Uniform" with boxes,\
     '../Data/NaiveInteger_Select_Uniform.data' using 1:24 title "Uniform" with boxes

set output 'UniformVsNonUniform_Rank_WallTime.tex'
plot '../Data/NaiveInteger_Rank_NonUniform.data' using 1:24 title "Non-Uniform" with boxes,\
     '../Data/NaiveInteger_Rank_Uniform.data' using 1:24 title "Uniform" with boxes





