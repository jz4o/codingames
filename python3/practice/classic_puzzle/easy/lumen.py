# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

LIGHT_SPOT = 'O'
DARK_SPOT = 'X'

n = int(input())
l = int(input())

padding_row = [LIGHT_SPOT] * (l * 2 + n)
padding_column = [LIGHT_SPOT] * l
grid = []
grid.extend([padding_row for i in range(l)])
for i in range(n):
    row = []
    row.extend(padding_column)
    for cell in input().split():
        row.append(cell)
        # pass
    row.extend(padding_column)

    grid.append(row)
grid.extend([padding_row for i in range(l)])

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

c_indexes = []
for row_index, row in enumerate(grid):
    for column_index, column in enumerate(row):
        if column == 'C':
            c_indexes.append((row_index, column_index))

replace_column = [LIGHT_SPOT] * (l * 2 - 1)
for row_index, column_index in c_indexes:
    for c_row_index in range(row_index - l + 1, row_index + l):
        grid[c_row_index][column_index - l + 1:column_index + l] = replace_column

result = sum(grid, []).count(DARK_SPOT)

# print("2")
print(result)
