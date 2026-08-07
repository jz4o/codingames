# import sys
# import math

import itertools
from dataclasses import dataclass, field

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
lines = []
for _ in range(n):
    line = input()
    lines.append(line)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

@dataclass(unsafe_hash=True)
class Cell:
    row: int = field(hash=True, compare=True)
    column: int = field(hash=True, compare=True)
    height: int = field(hash=False, compare=False)
    hold: int = field(hash=False, compare=False)
    is_overflow: bool = field(hash=False, compare=False)
    is_holded: bool = field(hash=False, compare=False)

ALPHABETS = list('ABCDEFGHIJKLMNOPQRSTUVWXYZ')

grid = [
    [
        Cell(row_index, column_index, ALPHABETS.index(value) + 1, 0, is_overflow=False, is_holded=False)
        for column_index, value
        in enumerate(line)
    ]
    for row_index, line
    in enumerate(lines)
]

for cell in grid[0]:
    cell.is_overflow = True
for cell in grid[-1]:
    cell.is_overflow = True
for row in grid:
    row[0].is_overflow = True
    row[-1].is_overflow = True

overflow_cells = [cell for cell in itertools.chain.from_iterable(grid) if cell.is_overflow]
overflow_cells_to_checks = [*overflow_cells]
while len(overflow_cells_to_checks) > 0:
    cell = overflow_cells_to_checks.pop(0)

    around_cell = [
        c
        for c
        in [
            grid[max(cell.row - 1, 0)][cell.column],
            grid[cell.row][max(cell.column - 1, 0)],
            grid[cell.row][min(cell.column + 1, n - 1)],
            grid[min(cell.row + 1, n - 1)][cell.column],
        ]
        if not c.is_overflow and c.height >= cell.height
    ]

    next_overflow_cells_to_checks = [
        c
        for c in around_cell
        if c not in overflow_cells_to_checks and c not in overflow_cells
    ]
    for c in next_overflow_cells_to_checks:
        c.is_overflow = True

    overflow_cells_to_checks.extend(next_overflow_cells_to_checks)
    overflow_cells.extend(next_overflow_cells_to_checks)

hold_cells = sorted(set(overflow_cells), key=lambda cell: cell.height)
for cell in hold_cells:
    cell.is_holded = True
hold_cells_to_checks = [*hold_cells]
while len(hold_cells_to_checks) > 0:
    cell = hold_cells_to_checks.pop(0)

    around_cells = [
        grid[max(cell.row - 1, 0)][cell.column],
        grid[cell.row][max(cell.column - 1, 0)],
        grid[cell.row][min(cell.column + 1, n - 1)],
        grid[min(cell.row + 1, n - 1)][cell.column],
    ]

    next_checks = [
        c
        for c
        in around_cells
        if not c.is_holded and c.height <= cell.height
    ]
    for c in next_checks:
        c.hold = max(cell.height - c.height, 0)
        c.height = cell.height
        c.is_holded = True

        hold_cells_to_checks.insert(0, c)

    for c in around_cells:
        if c.height <= cell.height:
            continue

        c.is_overflow = True
        c.is_holded = True

        insert_index = next(
            iter(index for index, cc in enumerate(hold_cells_to_checks) if c.height <= cc.height),
            len(hold_cells_to_checks),
        )
        hold_cells_to_checks.insert(insert_index, c)

result = sum(cell.hold for cell in itertools.chain.from_iterable(grid))

# print("volume")
print(result)
