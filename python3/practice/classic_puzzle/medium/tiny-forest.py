# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w = int(input())
h = int(input())
rows = []
for _ in range(h):
    row = input()
    rows.append(row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Position:
    def __init__(self, y, x, v):
        self.y = y
        self.x = x
        self.v = v

TREE = 'Y'
SEED = 'X'
GRASS = '.'
WALL = '#'

grid = [list(f'{WALL * 3}{row}{WALL * 3}') for row in rows]
for _ in range(3):
    grid.insert(0, [WALL] * (w + 6))
    grid.append([WALL] * (w + 6))

tree_positions = []
for row_index, row in enumerate(grid):
    for value_index, value in enumerate(row):
        if value == TREE:
            tree_positions.append(Position(row_index, value_index, value))

for tree_position in tree_positions:
    for row_distance in range(-3, 4):
        for column_distance in range(-3 + abs(row_distance), 3 - abs(row_distance) + 1):
            row_index = tree_position.y + row_distance
            column_index = tree_position.x + column_distance

            if grid[row_index][column_index] != WALL:
                grid[row_index][column_index] = TREE

before_tree_count = sum(row.count(TREE) for row in grid)

increase_tree_counts = []
for row_index in range(3, h + 3):
    for column_index in range(3, w + 3):
        increase_tree_count = 0
        for row_distance in range(-2, 3):
            increase_tree_count += [
                grid[row_index + row_distance][column_index + column_distance]
                for column_distance
                in range(-2 + abs(row_distance), 2 - abs(row_distance) + 1)
            ].count(GRASS)

        increase_tree_counts.append(increase_tree_count)

result = before_tree_count + max(increase_tree_counts)

# print("number of trees")
print(result)
