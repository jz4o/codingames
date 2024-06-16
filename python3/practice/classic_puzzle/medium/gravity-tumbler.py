# import sys
# import math

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

width, height = (int(i) for i in input().split())
count = int(input())
rasters = []
for _ in range(height):
    raster = input()

    rasters.append(list(raster))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

rasters = pd.DataFrame(rasters)
for _ in range(count):
    rasters = pd.DataFrame([sorted(row) for row in rasters.to_numpy()])
    rasters = pd.DataFrame(reversed(rasters.T.to_numpy()))

results = [''.join(row) for row in rasters.to_numpy()]

# print("...")
# print("write ###")
for result in results:
    print(result)
