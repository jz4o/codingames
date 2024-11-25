# import sys
# import math

import itertools

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
rows = []
for _ in range(n):
    row = input()
    rows.append(row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

ISLAND = '#'
WATER = '~'
EMPTY = '.'

class Cell:
    def __init__(self, y, x, v):
        self.y = y
        self.x = x
        self.v = v

temp_rows = [f'{EMPTY}{row}{EMPTY}' for row in rows]
temp_rows.insert(0, EMPTY * (n + 2))
temp_rows.append(EMPTY * (n + 2))

grid = [
    [Cell(row_index, value_index, value) for value_index, value in enumerate(row)]
    for row_index, row in enumerate(temp_rows)
]

be_check_islands = [cell for cell in itertools.chain.from_iterable(grid) if cell.v == ISLAND]
island_groups = []
while len(be_check_islands) > 0:
    check_island = be_check_islands.pop(0)

    new_island_group = set()
    be_check_group_islands = {check_island}
    while len(be_check_group_islands) > 0:
        check_group_island = be_check_group_islands.pop()

        new_island_group |= {check_group_island}
        if check_group_island in be_check_islands:
            be_check_islands.remove(check_group_island)

        around_islands = {
            cell
            for cell
            in [
                grid[check_group_island.y - 1][check_group_island.x],
                grid[check_group_island.y][check_group_island.x - 1],
                grid[check_group_island.y][check_group_island.x + 1],
                grid[check_group_island.y + 1][check_group_island.x],
            ]
            if cell.v == ISLAND
        }

        be_check_group_islands |= around_islands - new_island_group

    island_groups.append(new_island_group)

coast_lengths = []
for island_group in island_groups:
    waters = itertools.chain.from_iterable([
        [
            cell
            for cell
            in [
                grid[island.y - 1][island.x],
                grid[island.y][island.x - 1],
                grid[island.y][island.x + 1],
                grid[island.y + 1][island.x],
            ]
            if cell.v == WATER
        ]
        for island in island_group
    ])

    coast_lengths.append(len(set(waters)))

longest_coast = max(coast_lengths)
island_index = coast_lengths.index(longest_coast) + 1

result = f'{island_index} {longest_coast}'

# print("answer")
print(result)
