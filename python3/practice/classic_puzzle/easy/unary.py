import sys
import math

import numpy as np
import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

message = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

binary = ''.join([np.base_repr(ord(char), 2).rjust(7, '0') for char in message])

matched_list = []
while len(binary) > 0:
    b = binary[0]
    matched = re.findall(f'^{b}+', binary)[0]

    matched_list.append(matched)

    binary = binary.replace(matched, '', 1)

group_counts = [[2 - int(matched[0]), len(matched)] for matched in matched_list]
result = ' '.join(['0' * count for count in sum(group_counts, [])])

# print("answer")
print(result)
