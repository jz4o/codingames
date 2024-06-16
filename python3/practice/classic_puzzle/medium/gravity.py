# import sys
# import math

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

width, height = (int(i) for i in input().split())
grid = []
for _ in range(height):
    line = input()

    grid.append(list(line))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

grid = pd.DataFrame(grid)
grid = pd.DataFrame([sorted(row, reverse=True) for row in grid.T.to_numpy()])

results = [''.join(row) for row in  grid.T.to_numpy()]

# print("answer")
for result in results:
    print(result)
