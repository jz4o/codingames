# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

grid = []
for i in range(10):
    row = input()

    grid.append(['#', *list(row), '#'])

grid.insert(0, list('#' * len(grid[0])))
grid.append(list('#' * len(grid[0])))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class Position:
    def __init__(self, y, x):
        self.y = y
        self.x = x


mother_position = None
for row_index, row in enumerate(grid):
    if 'M' not in row:
        continue

    column_index = row.index('M')

    mother_position = Position(row_index, column_index)
    grid[row_index][column_index] = '.'

    break

check_positions = [mother_position]

turn = 0
while True:
    found_flag = False

    next_check_positions = []
    for check_position in check_positions:
        position = grid[check_position.y][check_position.x]

        if position == 'C':
            found_flag = True
            break

        if position != '.':
            continue

        grid[check_position.y][check_position.x] = turn
        next_check_positions.append(Position(check_position.y - 1, check_position.x))
        next_check_positions.append(Position(check_position.y, check_position.x - 1))
        next_check_positions.append(Position(check_position.y, check_position.x + 1))
        next_check_positions.append(Position(check_position.y + 1, check_position.x))

    if found_flag:
        break

    check_positions = next_check_positions

    turn += 1

distance = turn * 10

# print("shortest distance in km")
print(f'{distance}km')
