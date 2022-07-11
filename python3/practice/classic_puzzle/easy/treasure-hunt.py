# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

h, w = [int(i) for i in input().split()]
rows = []
for i in range(h):
    row = input()
    rows.append(row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class Position:
    def __init__(self, y, x, value):
        self.y = y
        self.x = x
        self.value = value


YOUR_POSITION = 'X'
WALL = '#'

rows = [f'{WALL}{row}{WALL}' for row in rows]
wall_row = WALL * len(rows[0])
rows.insert(0, wall_row)
rows.append(wall_row)

grid = []
for row_index, row in enumerate(rows):
    position_row = []
    for column_index, value in enumerate(row):
        position_row.append(Position(row_index, column_index, value))
    grid.append(position_row)

start_position = [position for position in sum(grid, []) if position.value == YOUR_POSITION][0]

move_histories = []
temp_histories = [[start_position]]
while len(temp_histories) > 0:
    temp_history = temp_histories.pop()
    last_position = temp_history[-1]

    around_positions = [
        grid[last_position.y - 1][last_position.x],  # top
        grid[last_position.y][last_position.x + 1],  # right
        grid[last_position.y + 1][last_position.x],  # bottom
        grid[last_position.y][last_position.x - 1]   # left
    ]

    around_positions = [pos for pos in around_positions if pos not in temp_history and pos.value != WALL]

    if len(around_positions) == 0:
        move_histories.append(temp_history)
        continue

    for position in around_positions:
        temp_histories.append([*temp_history, position])

amount_of_golds = []
for move_history in move_histories:
    amount_of_gold = sum([int(position.value) for position in move_history if position.value in '0123456789'])
    amount_of_golds.append(amount_of_gold)

result = max(amount_of_golds)

# print("answer")
print(result)
