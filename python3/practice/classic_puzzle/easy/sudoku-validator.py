import sys
import math

import numpy as np

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

grid = []
for i in range(9):
    row = []
    for j in input().split():
        n = int(j)
        row.append(n)
    grid.append(row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

groups= []
groups.extend(grid)
groups.extend([list(row) for row in np.array(grid).T])

sub_grids = [[] for i in range(9)]
for row_index in range(9):
    for column_index in range(9):
        sub_grid_index = (row_index // 3 * 3) + (column_index // 3)
        sub_grids[sub_grid_index].append(grid[row_index][column_index])
groups.extend(sub_grids)

result = 'true' if all([len(set(row)) == 9 for row in groups]) else 'false'

# print("true or false")
print(result)
