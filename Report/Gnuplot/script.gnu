#!/usr/bin/gnuplot
# Gnuplot script file for plotting data in file "force.dat"
	# This file is called   force.p
	set term epslatex standalone color size 6, 4
	set output 'myplot.tex'
	set autoscale                          # scale axes automatically
	unset log                              # remove any log-scaling
	unset label                            # remove any previous labels
	set xtic auto                          # set xtics automatically
	set ytic auto                          # set ytics automatically
	set title "Force Deflection Data for a Beam and a Column"
	set xlabel "Deflection (meters)"
	set ylabel "Force (kN)"
	set label "Yield Point" at 0.003,260
	set arrow from 0.0028,250 to 0.003,280
	set xr [0.0:0.022]					#range of x axis
	set yr [0:325]						#range of y axis
	plot "force.dat" using 1:2 title 'Column' with linespoints , \
	    "force.dat" using 1:3 title 'Beam' with points