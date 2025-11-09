# import sys
# import math

import itertools

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

r, c = [int(i) for i in input().split()]
rows = []
for _ in range(r):
    row = input()
    rows.append(row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

grid = [list(row) for row in rows]

CORNER_CHAR = '+'
HORIZONTAL_CHAR = '-'
VERTICAL_CHAR = '|'

HORIZONTAL_CHARS = [HORIZONTAL_CHAR, CORNER_CHAR]
VERTICAL_CHARS = [VERTICAL_CHAR, CORNER_CHAR]

count = 0
for row_index, row in enumerate(grid[:-1]):
    for column_index, value in enumerate(row[:-1]):
        if value != CORNER_CHAR:
            continue

        below_corner_row_indexes = [ri for ri in range(row_index + 1, r) if grid[ri][column_index] == CORNER_CHAR]
        for prev_below_row_index, below_row_index in itertools.pairwise([row_index, *below_corner_row_indexes]):
            prev_height = prev_below_row_index - row_index + 1
            prev_right_column_index = column_index + prev_height * 2 - 2

            height = below_row_index - row_index + 1
            right_column_index = column_index + height * 2 - 2

            top_horizontal_values = grid[row_index][prev_right_column_index:right_column_index] or []
            bottom_horizontal_values = grid[below_row_index][column_index + 1:right_column_index]
            left_vertical_values = [
                below_row[column_index]
                for below_row
                in grid[prev_below_row_index:below_row_index] or []
            ]
            right_vertical_values = [
                below_row[right_column_index] if right_column_index < len(below_row) else None
                for below_row
                in grid[row_index + 1:below_row_index]
            ]
            right_corner_values = [
                grid[row_index][right_column_index] if right_column_index < len(grid[row_index]) else None,
                grid[below_row_index][right_column_index] if right_column_index < len(grid[below_row_index]) else None,
            ]

            if not all(value in HORIZONTAL_CHARS for value in top_horizontal_values):
                break
            if not all(value in VERTICAL_CHARS for value in left_vertical_values):
                break

            if not all(value == CORNER_CHAR for value in right_corner_values):
                continue
            if not all(value in HORIZONTAL_CHARS for value in bottom_horizontal_values):
                continue
            if not all(value in VERTICAL_CHARS for value in right_vertical_values):
                continue

            count += 1

result = count

# print("[][][]")
print(result)
