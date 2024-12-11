# import sys
# import math

import string

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w, h = [int(i) for i in input().split()]
n = int(input())
input_rows = []
for _ in range(n):
    inputs = input().split()
    s = inputs[0]
    p = int(inputs[1])
    input_rows.append((s, p))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

clockwise_grid = [['-'] for _ in range(w)]
clockwise_grid.insert(0, ['+', *['|'] * h])
clockwise_grid.append(['+', *['|'] * h])

for character, point in input_rows:
    first_fall_direction = 1 if character in string.ascii_lowercase else -1

    target_point = point + 1
    fall_flag = True
    while fall_flag:
        fall_flag = False

        target_row = clockwise_grid[target_point]
        first_fall_row = clockwise_grid[target_point + first_fall_direction]
        second_fall_row = clockwise_grid[target_point - first_fall_direction]

        if len(first_fall_row) < len(target_row):
            target_point += first_fall_direction
            fall_flag = True
        elif len(second_fall_row) < len(target_row):
            target_point -= first_fall_direction
            fall_flag = True

    clockwise_grid[target_point].append(character)

transposed_grid = [
    list(reversed([*row, *([' '] * (h - len(row) + 1))]))
    for row in clockwise_grid
]
grid = pd.DataFrame(transposed_grid).T.to_numpy()
results = [''.join(row) for row in grid]

# print("answer")
for result in results:
    print(result)
