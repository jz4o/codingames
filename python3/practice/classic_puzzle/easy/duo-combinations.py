# import sys
# import math

import numpy as np

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

total = int(input())
symbols = []
for i in range(total):
    symbol = input()
    symbols.append(symbol)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


def each_cons(list, n):
    return [list[i:i + n] for i in range(len(list) - n + 1)]


binary_cycle = [np.base_repr(i, 2).rjust(total, '0') for i in range(1, 2**total)]

results = []
results.append(symbols[0] * total)
for zero, one in each_cons(symbols, 2):
    trans_table = str.maketrans({'0': zero, '1': one})
    results.extend([binary.translate(trans_table) for binary in binary_cycle])

# print("combination(s)")
for result in results:
    print(result)
