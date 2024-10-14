# import sys
# import math

import itertools

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

x, y = [int(i) for i in input().split()]
lines = []
for _ in range(y):
    line = input()
    lines.append(line)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Cell:
    def __init__(self, y, x, v):
        self.y = y
        self.x = x
        self.v = v
        self.checked = False

temp_lines = [f'0{line}0' for line in lines]
temp_lines.insert(0, '0' * (x + 2))
temp_lines.append('0' * (x + 2))

grid = [
    [
        Cell(line_index, value_index, int(value))
        for value_index, value
        in enumerate(line)
    ]
    for line_index, line
    in enumerate(temp_lines)
]

cells = list(itertools.chain.from_iterable(grid))

number_of_color_blocks = []
for i in range(1, 10):
    target_cells = {
        cell
        for cell
        in cells
        if cell.v == i
    }

    count = 0
    while len(target_cells) > 0:
        temp_cells = {target_cells.pop()}
        while len(temp_cells) > 0:
            temp_cell = temp_cells.pop()
            temp_cell.checked = True

            around_cells = {
                cell
                for cell
                in [
                    grid[temp_cell.y - 1][temp_cell.x],
                    grid[temp_cell.y][temp_cell.x - 1],
                    grid[temp_cell.y][temp_cell.x + 1],
                    grid[temp_cell.y + 1][temp_cell.x],
                ]
                if cell.v == temp_cell.v and not cell.checked
            }

            target_cells -= around_cells

            temp_cells |= (around_cells - temp_cells)

        count += 1

    if count == 0:
        continue

    number_of_color_blocks.append(f'{i} -> {count}')

results = number_of_color_blocks if len(number_of_color_blocks) > 0 else ['No coloring today']

# print("answer")
for result in results:
    print(result)
