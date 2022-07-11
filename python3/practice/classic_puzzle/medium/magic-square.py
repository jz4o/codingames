# import sys
# import math

import numpy as np
import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
grid = []
for i in range(n):
    row = []
    for j in input().split():
        c = int(j)

        row.append(c)

    grid.append(row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

grid = pd.DataFrame(grid)

check_all_sum = np.ravel(grid).sum() == sum(range(1, n**2 + 1))

line_sums = []
line_sums.extend([sum(row) for row in grid.values])
line_sums.extend([sum(row) for row in grid.T.values])
line_sums.append(sum([row[index] for index, row in enumerate(grid.values)]))
line_sums.append(sum([row[-index] for index, row in enumerate(grid.values, start=1)]))

result = 'MAGIC' if check_all_sum and len(set(line_sums)) == 1 else 'MUGGLE'

# print("answer")
print(result)
