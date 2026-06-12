# import sys
# import math

import itertools

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w, h = [int(i) for i in input().split()]
k = int(input())
rows = []
for _ in range(h):
    row = input()
    rows.append(row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

grid = [list(row) for row in rows]

for row_index, row in enumerate(grid):
    for column_index, value in enumerate(row):
        if value not in '0123456789':
            continue

        shadow_length = min(int(value) * k, row_index)
        for shadow_index in range(shadow_length):
            distance = shadow_index + 1
            grid[row_index - distance][column_index] = '.'

panel_count = list(itertools.chain.from_iterable(grid)).count('P')

result = str(panel_count * 100)

# print("result")
print(result)
