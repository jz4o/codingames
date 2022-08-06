# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

number_snails = int(input())
speed_snails = []
for i in range(number_snails):
    speed_snail = int(input())
    speed_snails.append(speed_snail)
map_height = int(input())
map_width = int(input())
rows = []
for i in range(map_height):
    row = input()
    rows.append(row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class Position:
    def __init__(self, y, x):
        self.y = y
        self.x = x


class Snail:
    def __init__(self, number, speed, position):
        self.number = number
        self.speed = speed
        self.position = position
        self.goal_time = None


snails = []
goal_positions = []

for row_index, row in enumerate(rows):
    for value_index, value in enumerate(row):
        if re.fullmatch(r'\d', value):
            value = int(value)
            snails.append(Snail(value, speed_snails[value - 1], Position(row_index, value_index)))
        elif value == '#':
            goal_positions.append(Position(row_index, value_index))

for snail in snails:
    if snail.speed == 0:
        continue

    distance = min([abs(goal.y - snail.position.y) + abs(goal.x - snail.position.x) for goal in goal_positions])

    snail.goal_time = distance / snail.speed

winner = sorted([snail for snail in snails if snail.goal_time is not None], key=lambda snail: snail.goal_time)[0]

result = winner.number

# print("winner is number")
print(result)
