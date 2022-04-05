import sys
import math

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

size = int(input())
angle = int(input())
lines = []
for i in range(size):
    line = input()
    lines.append(line)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

grid = pd.DataFrame([line.split() for line in lines])

DIAGONAL_SIZE = size * 2 - 1

rotate_count = ((angle - 45) % 360) // 90
for i in range(rotate_count):
    grid = pd.DataFrame(reversed(grid.T.values))

grid = [list(row) for row in grid.values]

diamond_grid = []
for time in range(1, DIAGONAL_SIZE + 1):
    start = max(0, time - size)
    count = min(time, size * 2 - time)

    diamond_grid.append([])

    for c in range(count):
        diamond_grid[-1].append(grid[start + c].pop())

results = [' '.join(row).center(DIAGONAL_SIZE) for row in diamond_grid]

# print("answer")
for result in results:
    print(result)
