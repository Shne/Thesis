#!/usr/bin/python3


def bwt(s):
	print("s = " + s)
	s_list = list(s)
	M = []
	M.append(s_list)
	permuted_s_list = []
	s_list_length = len(s_list)

	# generate matrix M of cyclic shifts
	for _ in range(s_list_length-1):
		for i in range(1,len(s_list)):
			permuted_s_list.append(s_list[i])
		permuted_s_list.append(s_list[0])		
		M.append(permuted_s_list)
		s_list = permuted_s_list
		permuted_s_list = []

	M_strings = []
	for lst in M:
		str1 = ''.join(lst)
		M_strings.append(str1)

	M_strings.sort()

	M_sorted = []
	for str1 in M_strings:
		M_sorted.append(list(str1))

	bwt_string = []

	for lst in M_sorted:
		last_column_index = len(lst)-1
		char = lst[last_column_index]
		bwt_string.append(char)

	print("bwt = " + ''.join(bwt_string))


bwt("bananahatbana")