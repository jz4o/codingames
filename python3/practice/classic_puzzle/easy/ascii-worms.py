# import sys
# import math

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

thickness = int(input())
length = int(input())
turns = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

grid_width = (thickness + 1) * (turns + 1) + 1

transposed_grid = [[' '] * (length + 1) for _ in range(grid_width)]
transposed_grid[0][1:] = ['|'] * length
transposed_grid[-1][1:] = ['|'] * length
for row in transposed_grid[1:-1]:
    row[0] = '_'
    row[-1] = '_'
turn_valley_part = ['|'] * (length - 1)
for t in range(1, turns + 1):
    i = (thickness + 1) * t
    transposed_grid[i] = [' ', *turn_valley_part, '_'] if t % 2 == 1 else ['_', ' ', *turn_valley_part]

results = [
    ''.join(row).rstrip()
    for row
    in pd.DataFrame(transposed_grid).T.to_numpy()
]

# print("Print your amazing ASCII worm here!")
for result in results:
    print(result)
