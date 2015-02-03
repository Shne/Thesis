#!/usr/bin/python3

import random #also seeds it with system time


alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
amount = 10000

randomArr = [random.choice(alphabet) for x in range(amount)]

randomStr = ''.join(randomArr)

print(''.join(alphabet))
print(len(alphabet))
print(randomStr)

