#!/usr/bin/fish
cd Code/Simple/NaiveInteger
for as in (seq 12 20)
	./dist/Release/GNU-Linux-x86/naiveinteger 7 $as 2 build 0 >> ../../../Report/Gnuplot/Data/BM_in_Node_emptystringcheck.data
end
