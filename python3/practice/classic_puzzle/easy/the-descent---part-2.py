# import sys
# import math

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w, h = [int(i) for i in input().split()]
grid = []
for _ in range(h):
    row = []
    for j in input().split():
        mountain_height = int(j)
        row.append(mountain_height)
    grid.append(row)
a, b = [int(i) for i in input().split()]
t = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

def get_sub_grids(grid, height, width):
    df = pd.DataFrame(grid)

    sub_grids = []
    for h in range(df.index.size - height + 1):
        sub_grids.extend([
            df.iloc[h:h+height, w:w+width].to_numpy().flatten()
            for w
            in range(df.columns.size - width + 1)
        ])

    return sub_grids

sub_grids = get_sub_grids(grid, a, b)
if a != b:
    sub_grids.extend(get_sub_grids(grid, b, a))

shots = []
for sub_grid in sub_grids:
    min_value = min(sub_grid)
    shot = sum(v - min_value for v in sub_grid)

    shots.append(shot)
min_shot: int = min(shots)

result = min_shot if min_shot <= t else 'Not Possible'

# print("Save the starship")
print(result)
