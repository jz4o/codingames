# import sys
# import math

from collections import defaultdict
from functools import reduce

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

start_direction = input()
n = int(input())
turns = []
for _ in range(n):
    turn = input()
    turns.append(turn)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

DIRECTIONS = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW']

move_functions = defaultdict(
    lambda: lambda index: index,
    {
        'RIGHT':lambda index: index + 1,
        'LEFT': lambda index: index - 1,
        'BACK': lambda index: index + 4,
    },
)

direction_index = DIRECTIONS.index(start_direction)
result_direction = reduce(
    lambda direction, turn: move_functions[turn](direction),
    turns,
    direction_index,
)

result = DIRECTIONS[result_direction % len(DIRECTIONS)]

# print("direction")
print(result)
