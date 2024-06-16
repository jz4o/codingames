# import sys
# import math

import numpy as np

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

grid = np.empty((0, 3), int)
for _ in range(3):
    line = input()

    grid = np.append(grid, np.array([list(line)]), axis=0)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

origin_grid = grid.copy()

# check row
for index in range(3):
    if sorted(grid[index, :]) == list('.OO'):
        grid[index, :] = list('OOO')

# check column
if (origin_grid == grid).all():
    for index in range(3):
        if sorted(grid[:, index]) == list('.OO'):
            grid[:, index] = list('OOO')

# check diagonal
if (origin_grid == grid).all() and sorted([grid[index, index] for index in range(3)]) == list('.OO'):
    for index in range(3):
        grid[index, index] = 'O'
if (origin_grid == grid).all() and sorted(grid[index, 2 - index] for index in range(3)) == list('.OO'):
    for index in range(3):
        grid[index, 2 - index] = 'O'

results = ['false'] if (origin_grid == grid).all() else [''.join(row) for row in grid]

# print("answer")
for result in results:
    print(result)
