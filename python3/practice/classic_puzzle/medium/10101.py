import sys
import math

import numpy as np

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w = int(input())
h = int(input())
grid = []
for i in range(h):
    row = input()
    grid.append(list(row))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

def get_completed_row_or_column_count(grid):
    return list(map(lambda row: all(row == '#'), [*grid, *grid.T])).count(True)


grid = np.array(grid)

scores = []
scores.append(get_completed_row_or_column_count(grid))
for row_index, row in enumerate(grid[:-1]):
    for column_index in range(len(row[:-1])):
        # check block can placed?
        if grid[row_index][column_index] != '.':
            continue
        if grid[row_index][column_index + 1] != '.':
            continue
        if grid[row_index + 1][column_index] != '.':
            continue
        if grid[row_index + 1][column_index + 1] != '.':
            continue

        # grid with block placed.
        copy_grid = grid.copy()
        copy_grid[row_index][column_index] = '#'
        copy_grid[row_index][column_index + 1] = '#'
        copy_grid[row_index + 1][column_index] = '#'
        copy_grid[row_index + 1][column_index + 1] = '#'

        # count columns and rows that could be completed.
        scores.append(get_completed_row_or_column_count(copy_grid))

result = max(scores)

# print("answer")
print(result)
