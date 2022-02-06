import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
grid = []
for i in range(n):
    line = input()

    grid.append(list(line))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

width = max(map(len, grid)) + 2
for row in grid:
    row.extend([' '] * (width - len(row)))
grid.append([' '] * width)
grid.append([' '] * width)

for row_index in reversed(range(n + 2)):
    for column_index in reversed(range(width)):
        if grid[row_index][column_index] != ' ':
            continue

        if row_index >= 2 and column_index >= 2 and grid[row_index - 2][column_index - 2] != ' ':
            grid[row_index][column_index] = '`'

        if row_index >= 1 and column_index >= 1 and grid[row_index - 1][column_index - 1] != ' ':
            grid[row_index][column_index] = '-'

results = map(lambda row: ''.join(row).rstrip(), grid)

# print("answer")
for result in results:
    print(result)
