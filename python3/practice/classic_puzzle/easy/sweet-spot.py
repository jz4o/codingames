import sys
import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
lines = []
for i in range(n):
    line = input()

    lines.append(line)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Mass:
    def __init__(self, y, x, value):
        self.y = y
        self.x = x
        self.value = value
        self.explosion = False


def explosion_a_bomb(grid, bomb_mass):
    for y in range(bomb_mass.y - 3, bomb_mass.y + 3 + 1):
        for x in range(bomb_mass.x - 3, bomb_mass.x + 3 + 1):
            diff_y = abs(bomb_mass.y - y)
            diff_x = abs(bomb_mass.x - x)
            max_diff = max(diff_y, diff_x)

            value = 4 - max_diff

            if not re.fullmatch('[A-Z]', str(grid[y][x].value)):
                grid[y][x].value = max(grid[y][x].value, value)

            grid[y][x].explosion = True


def explosion_h_bomb(grid, bomb_mass):
    value = 5

    for y in range(bomb_mass.y - 3, bomb_mass.y + 3 + 1):
        for x in range(bomb_mass.x - 3, bomb_mass.x + 3 + 1):
            if not re.fullmatch('[A-Z]', str(grid[y][x].value)):
                grid[y][x].value = max(grid[y][x].value, value)

            grid[y][x].explosion = True


def explosion_b_bomb(grid, bomb_mass):
    for n in range(1, 3 + 1):
        value = 4 - n

        explosion_masses = [
            grid[bomb_mass.y - n][bomb_mass.x],
            grid[bomb_mass.y + n][bomb_mass.x],
            grid[bomb_mass.y][bomb_mass.x - n],
            grid[bomb_mass.y][bomb_mass.x + n]
        ]

        for explosion_mass in explosion_masses:
            if not re.fullmatch('[A-Z]', str(explosion_mass.value)):
                explosion_mass.value = max(explosion_mass.value, value)

            explosion_mass.explosion = True


grid = [list(line) for line in lines]

grid = [[*[0] * 3, *row, *[0] * 3] for row in grid]
for i in range(3):
    grid.insert(0, [0] * (n + 6))
    grid.append([0] * (n + 6))

temp_grid = []
for row_index, row in enumerate(grid):
    temp_row = []
    for column_index, value in enumerate(row):
        v = int(value) if re.fullmatch('\\d', str(value)) else value
        temp_row.append(Mass(row_index, column_index, v))

    temp_grid.append(temp_row)

grid = temp_grid

masses = sum(grid, [])
a_bomb_masses = [mass for mass in masses if mass.value == 'A']
for bomb_mass in a_bomb_masses:
    explosion_a_bomb(grid, bomb_mass)

h_bomb_masses = [mass for mass in masses if mass.value == 'H']
for bomb_mass in h_bomb_masses:
    explosion_h_bomb(grid, bomb_mass)

explosion_b_bomb_masses = [mass for mass in masses if mass.value == 'B' and mass.explosion]
unexplosion_b_bomb_masses = [mass for mass in masses if mass.value == 'B' and not mass.explosion]
for bomb_mass in explosion_b_bomb_masses:
    explosion_b_bomb(grid, bomb_mass)

is_explosion = True
while is_explosion:
    is_explosion = False

    for bomb_mass in unexplosion_b_bomb_masses:
        if not bomb_mass.explosion:
            continue

        explosion_b_bomb(grid, bomb_mass)
        unexplosion_b_bomb_masses.remove(bomb_mass)

        is_explosion = True

results = []
for row in grid[3:-3]:
    result = ''.join([str(mass.value) for mass in row[3:-3]])
    results.append(result)

# print("answer")
for result in results:
    print(result)
