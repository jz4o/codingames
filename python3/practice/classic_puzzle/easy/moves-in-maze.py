# import sys
# import math

import numpy as np

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w, h = [int(i) for i in input().split()]
rows = []
for i in range(h):
    row = input()
    rows.append(row)
# for i in range(h):

    # Write an answer using print
    # To debug: print("Debug messages...", file=sys.stderr, flush=True)

    # print("answer")


class Position:
    def __init__(self, y, x):
        self.y = y
        self.x = x


REPLACEABLE_CHARS = ['S', '.']

grid = [list(row) for row in rows]

arive_positions = []
for row_index, row in enumerate(grid):
    if 'S' not in row:
        continue

    arive_positions.append(Position(row_index, row.index('S')))
    break

step = 0
while len(arive_positions) > 0:
    temp_arive_positions = []

    for position in arive_positions:
        if grid[position.y][position.x] in REPLACEABLE_CHARS:
            grid[position.y][position.x] = np.base_repr(step, 36).upper()

        around_positions = [
            Position(h - 1 if position.y == 0 else position.y - 1, position.x),
            Position(position.y, w - 1 if position.x == 0 else position.x - 1),
            Position(position.y, (position.x + 1) % w),
            Position((position.y + 1) % h, position.x)
        ]

        temp_arive_positions += [pos for pos in around_positions if grid[pos.y][pos.x] == '.']

    arive_positions = temp_arive_positions
    step += 1

results = map(''.join, grid)

for result in results:
    print(result)
