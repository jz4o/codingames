# import sys
# import math

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

width, height = [int(i) for i in input().split()]
grid = []
for i in range(height):
    line = input()

    grid.append(list(line))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

grid = pd.DataFrame(grid)
grid = pd.DataFrame(map(lambda row: reversed(sorted(row)), grid.T.values))

results = map(lambda row: ''.join(row), grid.T.values)

# print("answer")
for result in results:
    print(result)
