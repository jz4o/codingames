import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n, m = [int(i) for i in input().split()]
ts = []
for i in range(n):
    t = input()
    ts.append(t)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Position:
    def __init__(self, y, x, v):
        self.y = y
        self.x = x
        self.v = v


class Snake:
    def __init__(self, parts_size):
        self.parts_size = parts_size


HEAD_VALUE = 'o'
HORIZONTAL_VALUE = '-'
VERTICAL_VALUE = '|'
CURVE_VALUE = '*'
TAIL_VALUES = ['v', '<', '>', '^']
SEARCH_DIRECTIONS = ['top', 'right', 'left', 'bottom']

grid = [list(t) for t in ts]

tail_positions = []
for row_index, row in enumerate(grid):
    for value_index, value in enumerate(row):
        if value not in TAIL_VALUES:
            continue

        tail_positions.append(Position(row_index, value_index, value))

snakes = []
for tail_position in tail_positions:
    search_direction = SEARCH_DIRECTIONS[TAIL_VALUES.index(tail_position.v)]
    position = tail_position

    parts_size = 1
    while position.v != HEAD_VALUE:
        if search_direction == 'top':
            position.y -= 1
        elif search_direction == 'right':
            position.x += 1
        elif search_direction == 'left':
            position.x -= 1
        elif search_direction == 'bottom':
            position.y += 1

        position.v = grid[position.y][position.x]

        parts_size += 1

        if position.v != CURVE_VALUE:
            continue

        if search_direction in ['top', 'bottom']:
            left_x = max(position.x - 1, 0)
            search_direction = 'left' if grid[position.y][left_x] == HORIZONTAL_VALUE else 'right'
        elif search_direction in ['right', 'left']:
            top_y = max(position.y - 1, 0)
            search_direction = 'top' if grid[top_y][position.x] == VERTICAL_VALUE else 'bottom'

    snakes.append(Snake(parts_size))

max_size = max([snake.parts_size for snake in snakes])
max_size_count = len([snake for snake in snakes if snake.parts_size == max_size])

results = []
results.append(max_size)
results.append(max_size_count)

# print("Answer")
for result in results:
    print(result)
