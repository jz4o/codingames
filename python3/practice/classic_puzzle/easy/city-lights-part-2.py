# import sys
import math
from dataclasses import dataclass

import numpy as np

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

l = int(input())
w = int(input())
d = int(input())
n = int(input())
input_rows = []
for _ in range(n):
    s = input()
    input_rows.append(s)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

@dataclass
class Light:
    depth_index: int
    row_index: int
    column_index: int
    value: int

KIND_OF_NUMBER = 36

cube = []
temp_rows = list(input_rows)
while len(temp_rows) > 0:
    rows = temp_rows[:w]
    temp_rows = temp_rows[w:]

    grid = [
        [0 if v == '.' else int(v, KIND_OF_NUMBER) for v in row]
        for row
        in rows
    ]
    cube.append(grid)

    if len(temp_rows) > 0:
        temp_rows.pop(0)

lights: list[Light] = []
for depth_index, grid in enumerate(cube):
    for row_index, row in enumerate(grid):
        for column_index, value in enumerate(row):
            if value == 0:
                continue

            lights.append(Light(depth_index, row_index, column_index, value))

for light in lights:
    depth_distance_start = -min(light.depth_index, light.value)
    depth_distance_end = min(d - light.depth_index - 1, light.value)
    row_distance_start = -min(light.row_index, light.value)
    row_distance_end = min(w - light.row_index - 1, light.value)
    column_distance_start = -min(light.column_index, light.value)
    column_distance_end = min(l - light.column_index - 1, light.value)

    for depth_distance in range(depth_distance_start, depth_distance_end + 1):
        for row_distance in range(row_distance_start, row_distance_end + 1):
            for column_distance in range(column_distance_start, column_distance_end + 1):
                if all(v == 0 for v in [depth_distance, row_distance, column_distance]):
                    continue

                distance = round(math.sqrt(depth_distance**2 + row_distance**2 + column_distance**2))
                brightness = max(light.value - distance, 0)

                target_depth_index = light.depth_index + depth_distance
                target_row_index = light.row_index + row_distance
                target_column_index = light.column_index + column_distance
                cube[target_depth_index][target_row_index][target_column_index] += brightness

results = []
for grid in cube:
    for row in grid:
        result = ''.join(np.base_repr(min(v, KIND_OF_NUMBER - 1), KIND_OF_NUMBER) for v in row).upper()
        results.append(result)

    results.append('')
results.pop()

# print("Bobville")
for result in results:
    print(result)
