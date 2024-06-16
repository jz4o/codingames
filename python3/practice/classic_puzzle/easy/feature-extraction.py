# import sys
# import math

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

r, c = (int(i) for i in input().split())
pixel_grid = []
for _ in range(r):
    pixel_row = []
    for j in input().split():
        pixel = int(j)
        pixel_row.append(pixel)
    pixel_grid.append(pixel_row)
m, n = (int(i) for i in input().split())
weight_grid = []
for _ in range(m):
    weight_row = []
    for j in input().split():
        weight = int(j)
        weight_row.append(weight)
    weight_grid.append(weight_row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

df_pixel = pd.DataFrame(pixel_grid)
df_weight = pd.DataFrame(weight_grid)

results = []
for h in range(len(df_pixel.index) - len(df_weight.index) + 1):
    result = []
    for w in range(len(df_pixel.columns) - len(df_weight.columns) + 1):
        pixel_values = df_pixel.iloc[h:h + len(df_weight.index), w:w + len(df_weight.columns)].to_numpy()
        convolution_value = (pixel_values * df_weight.to_numpy()).sum()

        result.append(convolution_value)
    results.append(result)

results = [' '.join(map(str, result)) for result in results]

# print("output matrix")
for result in results:
    print(result)
