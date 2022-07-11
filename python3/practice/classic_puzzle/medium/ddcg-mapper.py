# import sys
# import math

import numpy as np

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.


class Line:
    def __init__(self, pattern, tempo):
        self.pattern = pattern
        self.tempo = tempo


l = int(input())
n = int(input())
lines = []
for i in range(n):
    inputs = input().split()
    pattern = inputs[0]
    tempo = int(inputs[1])

    pattern = pattern.replace('X', '1')
    lines.append(Line(int(pattern, 2), tempo))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

results = []
for i in range(1, l + 1):
    result_number = 0
    for line in lines:
        if i % line.tempo == 0:
            result_number |= line.pattern

    result = np.base_repr(result_number, 2).zfill(4).replace('1', 'X')

    results.insert(0, result)

# print("answer")
for result in results:
    print(result)
