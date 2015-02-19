#!/usr/bin/gnuplot
# Gnuplot script file for plotting data in file "force.dat"
	# This file is called   force.p
	set term epslatex color
	set output 'Gnuplot/derp.tex'
	# set autoscale                          # scale axes automatically
	# unset log                              # remove any log-scaling
	# unset label                            # remove any previous labels
	# set xtic auto                          # set xtics automatically
	# set ytic auto                          # set ytics automatically
	# set title "Force Deflection Data for a Beam and a Column"
	set xlabel "Skew"
	set ylabel "Number"
	# set label "Yield Point" at 0.003,260
	# set arrow from 0.0028,250 to 0.003,280
	# set xr [0.0:0.022]					#range of x axis
	# set yr [0:325]						#range of y axis
	plot "../Output/preallocated_n7_as12.output" using 1:2 title 'Cache Misses' with linespoints , \
		"../Output/preallocated_n7_as12.output" using 1:3 title 'Branch Mispredictions' with linespoints , \