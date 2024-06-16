# import sys
# import math

import itertools

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

rows = []
for _ in range(8):
    row = input()
    rows.append(row)
colour, move = input().split()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

WALL = '#'
WHITE = 'W'
BLACK = 'B'
EMPTY = '-'


class Position:
    def __init__(self, y, x, value):
        self.y = y
        self.x = x
        self.value = value


def move_stone(grid, move_position):
    grid_height = len(grid)
    grid_width = len(grid[0])

    grid[move_position.y][move_position.x] = move_position

    # top
    top_positions = list(reversed([row[move_position.x] for row in grid[:move_position.y]]))
    reverse_stones(top_positions, move_position.value)

    # top-right
    top_right_length = min(move_position.y, grid_width - move_position.x - 1)
    top_right_positions = [grid[move_position.y - i][move_position.x + i] for i in range(1, top_right_length + 1)]
    reverse_stones(top_right_positions, move_position.value)

    # right
    right_positions = grid[move_position.y][move_position.x + 1:]
    reverse_stones(right_positions, move_position.value)

    # bottom-right
    bottom_right_length = min(grid_height - move_position.y - 1, grid_width - move_position.x - 1)
    bottom_right_positions = [grid[move_position.y + i][move_position.x + i] for i in range(1, bottom_right_length + 1)]
    reverse_stones(bottom_right_positions, move_position.value)

    # bottom
    bottom_positions = [row[move_position.x] for row in grid[move_position.y + 1:]]
    reverse_stones(bottom_positions, move_position.value)

    # bottom-left
    bottom_left_length = min(grid_height - move_position.y - 1, move_position.x)
    bottom_left_positions = [grid[move_position.y + i][move_position.x - i] for i in range(1, bottom_left_length + 1)]
    reverse_stones(bottom_left_positions, move_position.value)

    # left
    left_positions = list(reversed(grid[move_position.y][:move_position.x]))
    reverse_stones(left_positions, move_position.value)

    # top-left
    top_left_length = min(move_position.y, move_position.x)
    top_left_positions = [grid[move_position.y - i][move_position.x - i] for i in range(1, top_left_length + 1)]
    reverse_stones(top_left_positions, move_position.value)


def reverse_stones(line_positions, move_value):
    same_color_indexes = [index for index, position in enumerate(line_positions) if position.value == move_value]
    if len(same_color_indexes) == 0:
        return
    nearest_same_color_index = same_color_indexes[0]

    reversed_value = BLACK if move_value == WHITE else WHITE

    reverse_target_positions = line_positions[:nearest_same_color_index]
    if any(position.value != reversed_value for position in reverse_target_positions):
        return

    for position in reverse_target_positions:
        position.value = move_value


grid = [[WALL, *row, WALL] for row in rows]
grid.insert(0, [WALL] * 10)
grid.append([WALL] * 10)

temp_grid = []
for row_index, row in enumerate(grid):
    temp_row = []
    for column_index, value in enumerate(row):
        temp_row.append(Position(row_index, column_index, value))
    temp_grid.append(temp_row)
grid = temp_grid

move_column, move_row = move
move_column = 'abcdefgh'.index(move_column) + 1
move_row = int(move_row)

move_position = Position(move_row, move_column, colour)

result = ''
if grid[move_row][move_column].value == EMPTY:
    before_white_count = len([position for position in itertools.chain.from_iterable(grid) if position.value == WHITE])
    before_black_count = len([position for position in itertools.chain.from_iterable(grid) if position.value == BLACK])

    move_stone(grid, move_position)

    after_white_count = len([position for position in itertools.chain.from_iterable(grid) if position.value == WHITE])
    after_black_count = len([position for position in itertools.chain.from_iterable(grid) if position.value == BLACK])

    is_legal_move = before_white_count != after_white_count and before_black_count != after_black_count
    result = f'{after_white_count} {after_black_count}' if is_legal_move else 'NULL'
else:
    result = 'NOPE'

# print("answer")
print(result)
