# import sys
# import math

import numpy as np

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

r = int(input())
n = int(input())
start_pattern = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

RULE_LENGTH = 8

reversed_binary_digits = list(reversed(np.base_repr(r, 2).zfill(RULE_LENGTH)))

rule = {}
for i in range(RULE_LENGTH):
    rule[np.base_repr(i, 2).zfill(3)] = reversed_binary_digits[i]

results = []
temp = start_pattern.replace('.', '0').replace('@', '1')

for i in range(n):
    result = temp.replace('0', '.').replace('1', '@')
    results.append(result)

    temp_length = len(temp)
    new_temp = temp[-1] + temp + temp[0]

    temp = ''
    for j in range(temp_length):
        temp += rule[new_temp[j:j + 3]]

# print(".....@.@.....")
for result in results:
    print(result)
