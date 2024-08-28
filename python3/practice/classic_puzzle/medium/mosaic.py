# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
lines = []
for _ in range(n):
    line = input()
    lines.append(line)
# for i in range(n):
#
#     # Write an answer using print
#     # To debug: print("Debug messages...", file=sys.stderr, flush=True)
#
#     print("solved line")

class Cell:
    def __init__(self, y, x, v):
        self.y = y
        self.x = x
        self.v = v

EMPTY = '.'
FILL = '#'
WALL = ' '

def get_around_cells(grid, y, x):
    cells = []
    for y_index in range(y - 1, y + 2):
        cells.extend([grid[y_index][x_index] for x_index in range(x - 1, x + 2)])

    return cells

def fill_around_cells(grid, y, x, fill_value):
    for y_index in range(y - 1, y + 2):
        for x_index in range(x - 1, x + 2):
            grid[y_index][x_index] = grid[y_index][x_index] or fill_value

grid = [[WALL, *([None] * n), WALL] for _ in range(n)]
grid.insert(0, [WALL] * (n + 2))
grid.append([WALL] * (n + 2))

cells = []
for line_index, line in enumerate(lines, start=1):
    for value_index, value in enumerate(line, start=1):
        if value in [EMPTY, WALL]:
            continue

        cell = Cell(line_index, value_index, int(value))
        cells.append(cell)

while len(cells) > 0:
    for index in reversed(range(len(cells))):
        cell = cells[index]

        around_cells = get_around_cells(grid, cell.y, cell.x)

        fill_value = None
        if cell.v == around_cells.count(FILL):
            fill_value = EMPTY
        elif cell.v == len([ac for ac in around_cells if ac in [FILL, None]]):
            fill_value = FILL

        if fill_value is None:
            continue

        fill_around_cells(grid, cell.y, cell.x, fill_value)
        del cells[index]

results = [
    ''.join(row[1:-1])
    for row
    in grid[1:-1]
]

for result in results:
    print(result)
