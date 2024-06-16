# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
grid = []
for _ in range(n):
    row = input()

    grid.append([int(j) for j in row])
for i in range(n):
    row = input()

    for j, v in enumerate(row):
        grid[i][j] += int(v)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

BORDER = 4

check_count = 0
mass_count = pow(n, 2)

while check_count < mass_count:
    for row_index in range(n):
        for column_index in range(n):
            if grid[row_index][column_index] < BORDER:
                check_count += 1
                continue

            check_count = 0
            grid[row_index][column_index] -= BORDER
            if row_index > 0:
                grid[row_index - 1][column_index] += 1
            if row_index < n - 1:
                grid[row_index + 1][column_index] += 1
            if column_index > 0:
                grid[row_index][column_index - 1] += 1
            if column_index < n - 1:
                grid[row_index][column_index + 1] += 1

# print("answer")
for row in grid:
    print(''.join([str(i) for i in row]))
