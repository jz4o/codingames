# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
elevation_rows = []
for _ in range(n):
    elevation_row = []
    for j in input().split():
        elevation = int(j)
        elevation_row.append(elevation)

    elevation_rows.append(elevation_row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Cell:
    def __init__(self, y, x, v):
        self.y = y
        self.x = x
        self.v = v

OCEAN_VALUE = 0

def is_include_ocean_cell(cells):
    return any(cell for cell in cells if cell.v == OCEAN_VALUE)

grid = [
    [
        Cell(row_index, value_index, elevation)
        for value_index, elevation
        in enumerate(elevation_row)
    ]
    for row_index, elevation_row
    in enumerate(elevation_rows)
]

center_index = n // 2
start_cell = grid[center_index][center_index]

reachable_cells = {start_cell}
be_check_cells = {start_cell}
while len(be_check_cells) > 0:
    check_cell = be_check_cells.pop()

    around_cells = {
        cell
        for cell
        in [
            grid[check_cell.y - 1][check_cell.x],
            grid[check_cell.y][check_cell.x - 1],
            grid[check_cell.y][check_cell.x + 1],
            grid[check_cell.y + 1][check_cell.x],
        ]
        if check_cell.v - 1 <= cell.v <= check_cell.v + 1
    }

    new_cells = around_cells - reachable_cells - be_check_cells

    reachable_cells |= new_cells
    if is_include_ocean_cell(new_cells):
        break

    be_check_cells |= new_cells

result = 'yes' if is_include_ocean_cell(reachable_cells) else 'no'

# print("maybe")
print(result)
