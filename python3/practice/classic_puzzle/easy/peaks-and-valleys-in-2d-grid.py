# import sys
# import math

import itertools

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

h = int(input())
lines = []
for _ in range(h):
    line = input()
    lines.append(line)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Point:
    def __init__(self, y, x):
        self.y = y
        self.x = x

    def __str__(self):
        return f'({self.x}, {self.y})'

grid = [
    [None, *[int(v) for v in line.split()], None]
    for line
    in lines
]
grid.insert(0, [None] * len(grid[0]))
grid.append([None] * len(grid[0]))

peak_points = []
valley_points = []
for row_index, row in enumerate(grid):
    for column_index, value in enumerate(row):
        if value is None:
            continue

        around_values = list(itertools.chain.from_iterable(
            [v for v in r[(column_index - 1):column_index + 2] if v is not None]
            for r
            in grid[(row_index - 1):(row_index + 2)]
        ))

        value_count = len([v for v in around_values if v == value])
        if value_count != 1:
            continue

        point = Point(row_index - 1, column_index - 1)

        if max(*around_values) == value:
            peak_points.append(point)

        if min(*around_values) == value:
            valley_points.append(point)

results = [
    ', '.join(str(point) for point in peak_points) if len(peak_points) > 0 else 'NONE',
    ', '.join(str(point) for point in valley_points) if len(valley_points) > 0 else 'NONE',
]

# print("Peak Coordinates or None")
# print("Valley Coordinates or None")
for result in results:
    print(result)
