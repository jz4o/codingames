# import sys
# import math

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())  # the number of mountains
heights: list[int] = []
for i in input().split():
    height = int(i)
    heights.append(height)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


def each_cons(target_list, n):
    return [target_list[i:i + n] for i in range(len(target_list) - n + 1)]


def create_row(width, str_index, string):
    row = [' '] * width
    row[str_index] = string

    return row


max_height = max(*heights, 0)
min_height = min(*heights, 0)

grid_height = max_height - min_height + 1

grid = []
for a, b in each_cons([0, *heights, 0], 2):
    if a <= b:
        grid.append(create_row(grid_height, max_height - a, '\\'))

        grid.extend(create_row(grid_height, max_height - h, '/') for h in range(a, b + 1))
    else:
        grid.extend(create_row(grid_height, max_height - h, '\\') for h in reversed(range(b, a + 1)))

        grid.append(create_row(grid_height, max_height - b, '/'))

begin_width_index = 2 if next(iter(heights), 0) > 0 else 0
end_width_index = -2 if next(iter(reversed(heights)), 0) > 0 else None
effective_height = max_height if min(heights) > 0 else grid_height

effective_grid = [
    row[:effective_height]
    for row
    in grid[begin_width_index:end_width_index]
]

results = [''.join(row).rstrip() for row in pd.DataFrame(effective_grid).T.to_numpy()]

# print("mountains")
for result in results:
    print(result)
