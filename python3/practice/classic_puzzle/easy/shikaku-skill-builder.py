# import sys
# import math

import itertools
from dataclasses import dataclass

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w, h = [int(i) for i in input().split()]
grid = []
for _ in range(h):
    row = []
    for j in input().split():
        n = int(j)
        row.append(n)
    grid.append(row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

@dataclass
class Cell:
    row: int
    column: int
    value: int

class CellResult:
    def __init__(self, row, column, width, height):
        self.row = row
        self.column = column
        self.width = width
        self.height = height

    def __str__(self):
        return f'{self.row} {self.column} {self.width} {self.height}'

number_cells = []
for row_index, row in enumerate(grid):
    for column_index, value in enumerate(row):
        if value == 0:
            continue

        number_cells.append(Cell(row_index, column_index, value))

results = []
for cell in number_cells:
    cell_results = []
    for width in range(1, cell.value + 1):
        if cell.value % width != 0:
            continue

        height = cell.value // width

        min_row_index = max(cell.row - height + 1, 0)
        max_row_index: int = min(h - height, cell.row)
        min_column_index = max(cell.column - width + 1, 0)
        max_column_index = min(w - width, cell.column)

        for row_index in range(min_row_index, max_row_index + 1):
            for column_index in range(min_column_index, max_column_index + 1):
                values = [
                    row[column_index:column_index + width]
                    for row
                    in grid[row_index:row_index + height]
                ]
                if sum(itertools.chain.from_iterable(values)) != cell.value:
                    continue

                cell_results.append(CellResult(row_index, column_index, width, height))
    if len(cell_results) == 0:
        continue

    cell_results.sort(key=lambda cr: [cr.row, cr.column])

    results.append(f'{cell.row} {cell.column} {cell.value}')
    results.extend(cell_results)

# print("answer")
for result in results:
    print(result)
