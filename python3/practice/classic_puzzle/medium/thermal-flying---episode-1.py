# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

width = int(input())
height = int(input())
t = int(input())
lines = []
for i in range(height):
    line = input()
    lines.append(line)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

grid = list(reversed([re.findall(r'\.|V|-?\d', line) for line in lines]))

v_row = [row for row in grid if 'V' in row][0]
v_y = grid.index(v_row)
v_x = v_row.index('V')

for row_index, row in enumerate(grid):
    grid[row_index] = [0 if value in '.V' else int(value) for value in row]

for _ in range(t):
    if v_x + 1 == width:
        break
    if v_y == 0:
        break

    moved_x = v_x + 1
    moved_y = v_y - 1

    thermal = grid[moved_y][moved_x]
    moved_y += thermal

    if height <= moved_y:
        break

    v_x = moved_x
    v_y = moved_y

# print("answer")
print(f'{v_x} {v_y}')
