# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w = int(input())
h = int(input())
grid = []
grid.append([1] * (w + 2))
for _ in range(h):
    row = []

    row.append(1)
    for j in input().split():
        v = int(j)
        row.append(v)
    row.append(1)

    grid.append(row)
grid.append([1] * (w + 2))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


def find_pirates_treasure_indexes(grid):
    for row_index, row in enumerate(grid[1:-1], start=1):
        for column_index, column in enumerate(row[1:-1], start=1):
            if 0 in grid[row_index - 1][column_index - 1:column_index + 2]:
                continue
            if row[column_index - 1] == 0:
                continue
            if column != 0:
                continue
            if row[column_index + 1] == 0:
                continue
            if 0 in grid[row_index + 1][column_index - 1:column_index + 2]:
                continue

            return f'{column_index - 1} {row_index - 1}'


result = find_pirates_treasure_indexes(grid)

# print("x y")
print(result)
