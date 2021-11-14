import sys
import math

import numpy as np

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

n += 1
binary_length = len(np.base_repr(n))

result = 0
for i in range(1, binary_length + 1):
    div, mod = divmod(n, 2**i)

    result += div * (2**(i - 1)) + max(0, mod - (2**(i - 1)))

# print("Number of 1s")
print(result)
