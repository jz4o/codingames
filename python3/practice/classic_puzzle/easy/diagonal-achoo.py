# import sys
# import math

import itertools
from dataclasses import dataclass

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
g = int(input())
rows_list = []
for _ in range(g):
    rows = []
    for _ in range(n):
        row = input()
        rows.append(row)
    rows_list.append(rows)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

NORMAL_PERSON = '.'
HEALTHY_PERSON = 'H'
CONTAGIOUS_PERSON = 'C'

@dataclass
class Cell:
    y: int
    x: int
    v: str

grids = [
    [list(row) for row in rows]
    for rows
    in rows_list
]

infected_grids = []
for grid in grids:
    temp_grid = [[HEALTHY_PERSON, *row, HEALTHY_PERSON] for row in grid]
    temp_grid.insert(0, [HEALTHY_PERSON] * (n + 2))
    temp_grid.append([HEALTHY_PERSON] * (n + 2))

    cell_grid = [
        [Cell(row_index, column_index, value) for column_index, value in enumerate(row)]
        for row_index, row
        in enumerate(temp_grid)
    ]

    cells_to_check = [
        cell
        for cell
        in itertools.chain.from_iterable(cell_grid)
        if cell.v == CONTAGIOUS_PERSON
    ]

    checked_cells = []
    while len(cells_to_check) > 0:
        target_cell = cells_to_check.pop()
        checked_cells.append(target_cell)

        next_check_cells = [
            cell
            for cell
            in [
                cell_grid[target_cell.y - 1][target_cell.x - 1],
                cell_grid[target_cell.y - 1][target_cell.x + 1],
                cell_grid[target_cell.y + 1][target_cell.x - 1],
                cell_grid[target_cell.y + 1][target_cell.x + 1],
            ]
            if cell.v == NORMAL_PERSON
        ]

        for cell in next_check_cells:
            cell.v = CONTAGIOUS_PERSON

        cells_to_check.extend(
            cell
            for cell
            in next_check_cells
            if cell not in cells_to_check and cell not in checked_cells
        )

    infected_grids.append([
        row[1:-1]
        for row
        in cell_grid[1:-1]
    ])

most_infected_count = 0
most_infected_grid_index = None
most_infected_grid = []
for index, grid in enumerate(infected_grids):
    count = [cell.v for cell in itertools.chain.from_iterable(grid)].count(CONTAGIOUS_PERSON)
    if count <= most_infected_count:
        continue

    most_infected_count = count
    most_infected_grid_index = index
    most_infected_grid = grid

results = []
results.append(str(most_infected_grid_index))
results.extend(''.join(cell.v for cell in row) for row in most_infected_grid)

# print("Index (starts from 0)")
# print("C.C.")
# print(".C.C")
# print("C.H.")
# print(".C..")
for result in results:
    print(result)
