# import sys
# import math

import numpy as np

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

binary_length = len(np.base_repr(n))

zero_include_n = n + 1

result = 0
for i in range(binary_length):
    zero_length_in_cycle = 2**i
    one_length_in_cycle = 2**i

    binary_cycle_length = zero_length_in_cycle + one_length_in_cycle

    div, mod = divmod(zero_include_n, binary_cycle_length)

    result += (div * one_length_in_cycle) + max(mod - zero_length_in_cycle, 0)

# print("Number of 1s")
print(result)
