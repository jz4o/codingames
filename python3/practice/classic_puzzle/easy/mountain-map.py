# import sys
# import math

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())  # the number of mountains
heights = []
for i in input().split():
    # height: height of the mountain
    height = int(i)

    heights.append(height)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

max_height = max(heights)

transposed_map = []
for height in heights:
    for h in range(height):
        transposed_map.append(list(f'{" " * (max_height - h - 1)}/{" " * h}'))

    for h in range(height):
        transposed_map.append(list(f'{" " * (max_height - height + h)}\\{" " * (height - h -1)}'))

mountain_map = pd.DataFrame(transposed_map).T.values

results = [''.join(row).rstrip() for row in mountain_map]

# print("answer")
for result in results:
    print(result)
