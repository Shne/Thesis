#!/usr/bin/gnuplot

	set term epslatex color
	set output 'Gnuplot/derp.tex'
	set style data boxplot
	plot 'naiveRankSkewRunningTime.data' using (1.0):2:(0):9


	# set autoscale                          # scale axes automatically
	# unset log                              # remove any log-scaling
	# unset label                            # remove any previous labels
	# set xtic auto                          # set xtics automatically
	# set ytic auto                          # set ytics automatically
	# set title "Force Deflection Data for a Beam and a Column"
	# set xlabel "Skew"
	# set ylabel "Wall Time (microsec)"
	# set label "Yield Point" at 0.003,260
	# set arrow from 0.0028,250 to 0.003,280
	# set xr [0.0:0.022]					#range of x axis
	# set yr [0:325]						#range of y axis
	# plot "../Output/preallocated_n7_as12.output" using 1:2 title 'Cache Misses' with linespoints , \
		# "../Output/preallocated_n7_as12.output" using 1:3 title 'Branch Mispredictions' with linespoints , \


	# set border 2 front lt black linewidth 1.000 dashtype solid
	# set boxwidth 0.5 absolute
	# set style fill solid 0.25 border lt -1
	# unset key
	# set pointsize 0.5
	
	# set xtics border in scale 0,0 nomirror norotate  autojustify
	# set xtics  norangelimit
	# set xtics   ("2" 1.00000, "3" 2.00000)
	# set ytics border in scale 1,0.5 nomirror norotate  autojustify
	# set yrange [ 0.00000 : 100.000 ] noreverse nowriteback
	# x = 0.0
	## Last datafile plotted: "silver.dat"
	