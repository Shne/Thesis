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
	return ''.join(bwt_string)


def reverseBwt(s):
	s_matrix = list(s)
	s_list_length = len(s_matrix)

	for j in range(s_list_length-1):
		print("Add-----------")
		for k in range(s_list_length):
			print (s_matrix[k])
		

		s_matrix.sort()
		print("Sort-----------")
		for k in range(s_list_length):
			print (s_matrix[k])

		s_list = list(s)
		temp_matrix = s_matrix
		s_matrix = []		
		for i in range(s_list_length):
			s_matrix.append(str(s_list[i]) + str(temp_matrix[i]))
		

	print("Final-----------")
	for k in range(s_list_length):
		print (s_matrix[k])
	print("-----------")

	for i in range(len(s_matrix)):
		row = list(s_matrix[i])
		if(row[len(row)-1] == "#"):			
			print("s = " + s_matrix[i])
			return s_matrix[i]

	


theBwt = bwt("dca#")
reverseBwt(theBwt)