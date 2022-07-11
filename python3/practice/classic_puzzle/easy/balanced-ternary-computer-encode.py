# import sys
# import math

import numpy as np

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

BASE_NUM = 3

reverse_results = []
for index, num in enumerate(map(int, reversed(np.base_repr(abs(n), BASE_NUM)))):
    if len(reverse_results) <= index:
        reverse_results.append(0)

    reverse_results[index] += num
    target = reverse_results[index]

    if target < BASE_NUM - 1:
        continue

    reverse_results[index] -= BASE_NUM

    next_index = index + 1
    if len(reverse_results) <= next_index:
        reverse_results.append(0)

    reverse_results[next_index] += 1

if n < 0:
    reverse_results = [-num for num in reverse_results]

result = ''.join(map(lambda num: 'T' if num < 0 else str(num), reversed(reverse_results)))

# print("42")
print(result)
