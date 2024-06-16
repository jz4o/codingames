# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w = int(input())
h = int(input())
grid = []
grid.append([0] * (w + 2))
for _ in range(h):
    line = input()

    grid.append([0, *[int(c) for c in line.replace('.', '0').replace('x', '9')], 0])
grid.append([0] * (w + 2))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

for row_index in range(1, h + 1):
    for column_index in range(1, w + 1):
        if grid[row_index][column_index] != 9:
            continue

        if grid[row_index - 1][column_index - 1] != 9:
            grid[row_index - 1][column_index - 1] += 1
        if grid[row_index - 1][column_index] != 9:
            grid[row_index - 1][column_index] += 1
        if grid[row_index - 1][column_index + 1] != 9:
            grid[row_index - 1][column_index + 1] += 1
        if grid[row_index][column_index - 1] != 9:
            grid[row_index][column_index - 1] += 1
        if grid[row_index][column_index + 1] != 9:
            grid[row_index][column_index + 1] += 1
        if grid[row_index + 1][column_index - 1] != 9:
            grid[row_index + 1][column_index - 1] += 1
        if grid[row_index + 1][column_index] != 9:
            grid[row_index + 1][column_index] += 1
        if grid[row_index + 1][column_index + 1] != 9:
            grid[row_index + 1][column_index + 1] += 1

results = []
for row in grid[1:-1]:
    result = ''.join(map(str, row[1:-1])).replace('0', '.').replace('9', '.')
    results.append(result)

# print("answer")
for result in results:
    print(result)
