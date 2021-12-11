import sys
import math

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

width, height = [int(i) for i in input().split()]
count = int(input())
rasters = []
for i in range(height):
    raster = input()

    rasters.append(list(raster))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

rasters = pd.DataFrame(rasters)
for i in range(count):
    rasters = pd.DataFrame(map(lambda row: sorted(row), rasters.values))
    rasters = pd.DataFrame(reversed(rasters.T.values))

results = map(lambda row: ''.join(row), rasters.values)

# print("...")
# print("write ###")
for result in results:
    print(result)
