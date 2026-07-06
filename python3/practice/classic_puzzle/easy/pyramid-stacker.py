# import sys
# import math

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n, h = [int(i) for i in input().split()]
cubes = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

def each_slice(target_list: list, n: int):
    return [target_list[i:i + n] for i in range(0, len(target_list), n)]

pyramid_view_cubes = []
prev_cube_count = 0
for layer in range(h, 0, -1):
    layer_cube_count = layer ** 2

    layer_cubes = cubes[prev_cube_count:prev_cube_count + layer_cube_count]
    complement_list = [None] * layer
    layer_top_view_cube_grid = [
        [*line_cubes, *complement_list][:layer]
        for line_cubes
        in each_slice(list(layer_cubes), layer)
    ]

    layer_front_view_cubes = [
        next(reversed([c for c in line_cubes if c is not None]), ' ')
        for line_cubes
        in pd.DataFrame(layer_top_view_cube_grid).T.to_numpy()
    ]
    pyramid_view_cubes.insert(0, layer_front_view_cubes)

    prev_cube_count += layer_cube_count

pyramid_width = h * 2 - 1

results = [
    ' '.join(layer_front_view_cubes).center(pyramid_width).rstrip()
    for layer_front_view_cubes
    in pyramid_view_cubes
]

# print("pyramid")
for result in results:
    print(result)
