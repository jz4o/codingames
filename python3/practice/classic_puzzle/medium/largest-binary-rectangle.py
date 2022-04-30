import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

width, height = [int(i) for i in input().split()]
grid = []
for i in range(height):
    row = []
    for j in input().split():
        cell = int(j)
        row.append(cell)
    grid.append(row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

rectangle_sizes = []
for row_index, row in enumerate(grid):
    for cell_index, cell in enumerate(row):
        if cell != 1:
            continue

        for h in range(1, height - row_index + 1):
            h_rows = grid[row_index:row_index+h]

            for w in range(1, width - cell_index + 1):
                binary_rows = [h_row[cell_index:cell_index+w] for h_row in h_rows]
                if all([0 not in binary_row for binary_row in binary_rows]):
                    rectangle_sizes.append(sum([len(binary_row) for binary_row in binary_rows]))

result = max(rectangle_sizes)

# print("answer")
print(result)
