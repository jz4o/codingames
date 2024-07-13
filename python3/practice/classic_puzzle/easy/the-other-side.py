# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

h = int(input())
w = int(input())
rows = []
for _ in range(h):
    row = input()
    rows.append(row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Position:
    def __init__(self, y, x, value, is_passed):
        self.y = y
        self.x = x
        self.value = value
        self.is_passed = is_passed

WALL = '#'
EMPTY = '+'

LEFT_COLUMN_INDEX = 1
RIGHT_COLUMN_INDEX = w

value_grid = [[WALL, *row.split(' '), WALL] for row in rows]
value_grid.insert(0, [WALL] * (w + 2))
value_grid.append([WALL] * (w + 2))

grid = []
for row_index, value_row in enumerate(value_grid):
    row = []
    for column_index, value in enumerate(value_row):
        is_passed = None
        if value == EMPTY and column_index == RIGHT_COLUMN_INDEX:
            is_passed = True
        elif value == WALL:
            is_passed = False

        position = Position(row_index, column_index, value, is_passed)
        row.append(position)

    grid.append(row)

for row in grid:
    left_position = row[LEFT_COLUMN_INDEX]
    if left_position.is_passed is not None:
        continue

    positions = []
    checked_positions = []
    be_check_positions = [left_position]
    while len(be_check_positions) > 0:
        check_position = be_check_positions.pop()

        positions.append(check_position)

        around_positions = [
            grid[check_position.y - 1][check_position.x],
            grid[check_position.y][check_position.x - 1],
            grid[check_position.y][check_position.x + 1],
            grid[check_position.y + 1][check_position.x],
        ]
        around_positions = [position for position in around_positions if position.value == EMPTY]

        be_check_positions.extend(list(set(around_positions) - set(checked_positions)))
        checked_positions.extend(around_positions)

    is_passed = any(position.is_passed for position in positions)
    if is_passed:
        for position in positions:
            position.is_passed = True

result = len([row for row in grid if row[LEFT_COLUMN_INDEX].is_passed])

# print("count")
print(result)
