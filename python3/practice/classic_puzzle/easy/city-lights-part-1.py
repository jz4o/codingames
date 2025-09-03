# import sys

import itertools
import math

import numpy as np

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

h = int(input())
w = int(input())
ss = []
for _ in range(h):
    s = input()
    ss.append(s)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Light:
    def __init__(self, row_index, column_index, value):
        self.row_index = row_index
        self.column_index = column_index
        self.value = value

KIND_OF_NUMBER = 36

number_grid = [
    [
        int(v, KIND_OF_NUMBER)
        for v in s.replace('.', '0')
    ]
    for s in ss
]

lights = list(itertools.chain.from_iterable(
    [
        Light(row_index, column_index, value)
        for column_index, value in enumerate(row)
        if value != 0
    ]
    for row_index, row in enumerate(number_grid)
))

for light in lights:
    row_distance_range = range(
        -min(light.row_index, light.value),
        min(h - light.row_index - 1, light.value) + 1,
    )
    column_distance_range = range(
        -min(light.column_index, light.value),
        min(w - light.column_index - 1, light.value) + 1,
    )

    for row_distance in row_distance_range:
        for column_distance in column_distance_range:
            if all(distance == 0 for distance in [row_distance, column_distance]):
                continue

            distance = math.sqrt(abs(row_distance)**2 + abs(column_distance)**2)
            brightness = max(round(light.value - distance), 0)
            number_grid[light.row_index + row_distance][light.column_index + column_distance] += brightness

results = [
    ''.join(np.base_repr(min(value, KIND_OF_NUMBER - 1), KIND_OF_NUMBER) for value in row).upper()
    for row in number_grid
]

# print("Bobville")
for result in results:
    print(result)
