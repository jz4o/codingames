# import sys
# import math

from collections import defaultdict

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

m, n, p = [int(i) for i in input().split()]
count_a, count_b = [int(i) for i in input().split()]
a_input_rows = []
for _ in range(count_a):
    inputs = input().split()
    row = int(inputs[0])
    column = int(inputs[1])
    value = float(inputs[2])
    a_input_rows.append([row, column, value])
b_input_rows = []
for _ in range(count_b):
    inputs = input().split()
    row = int(inputs[0])
    column = int(inputs[1])
    value = float(inputs[2])
    b_input_rows.append([row, column, value])

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Cell:
    def __init__(self, row, column, value):
        self.row = row
        self.column = column
        self.value = value

a_cells = [Cell(row, column, value) for row, column, value in a_input_rows]
b_cells = [Cell(row, column, value) for row, column, value in b_input_rows]

result_cell_dict = defaultdict(int)
for a_cell in a_cells:
    for b_cell in b_cells:
        if a_cell.column != b_cell.row:
            continue

        result_cell_dict[f'{a_cell.row},{b_cell.column}'] += a_cell.value * b_cell.value

result_cells = []
for key, value in result_cell_dict.items():
    if value == 0:
        continue

    row, column = [int(k) for k in key.split(',')]
    result_cells.append(Cell(row, column, value))

results = [
    f'{cell.row} {cell.column} {cell.value}'
    for cell
    in sorted(result_cells, key=lambda cell: (cell.row, cell.column))
]

# print("row column value")
for result in results:
    print(result)
