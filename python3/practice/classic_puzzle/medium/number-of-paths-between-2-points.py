# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

m = int(input())
n = int(input())
grid = []
grid.append([1] * (n + 1))
for _ in range(m):
    row = input()

    grid.append([1, *map(int, row)])

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

path_map = [[0] * (n + 1) for i in range(m + 1)]

grid[1][1] = 1
path_map[1][1] = 1

for row_index in range(1, m + 1):
    for column_index in range(1, n + 1):
        if grid[row_index][column_index] != 0:
            continue

        top_math_paths = path_map[row_index - 1][column_index]
        left_math_paths = path_map[row_index][column_index - 1]
        path_map[row_index][column_index] = top_math_paths + left_math_paths

# print("answer")
print(path_map[m][n])
