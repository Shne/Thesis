#!/usr/bin/gnuplot
set term epslatex color

set xtics ("Size" 0, "Resident" 3, "High Water Mark" 6) rotate by -30

set ytics auto
set yrange [0:*]

set boxwidth 1.0
set style fill solid

set output 'NaiveVsPreallocatedBuild_n8as12.tex'
plot '../Data/NaiveVsPreallocatedBuild_n8as12.data' every 3    using 1:2 title "Naive " with boxes ls 1,\
     '../Data/NaiveVsPreallocatedBuild_n8as12.data' every 3::1 using 1:2 title "Preallocated" with boxes ls 2


set output 'NaiveVsPreallocatedBuild_n7as12.tex'
plot '../Data/NaiveVsPreallocatedBuild_n7as12.data' every 3    using 1:2 title "Naive " with boxes ls 1,\
     '../Data/NaiveVsPreallocatedBuild_n7as12.data' every 3::1 using 1:2 title "Preallocated" with boxes ls 2
