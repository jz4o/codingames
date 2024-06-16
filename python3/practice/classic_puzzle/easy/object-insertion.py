# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

a, b = (int(i) for i in input().split())
object_lines = []
for _ in range(a):
    object_line = input()
    object_lines.append(object_line)
c, d = (int(i) for i in input().split())
grid = []
for _ in range(c):
    grid_line = input()
    grid.append(list(grid_line))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class Point:
    def __init__(self, y, x):
        self.y = y
        self.x = x


object_parts_points = []
for line_index, object_line in enumerate(object_lines):
    for char_index, char in enumerate(object_line):
        if char == '*':
            object_parts_points.append(Point(line_index, char_index))

putable_points = []
for line_index in range(c - a + 1):
    for column_index in range(d - b + 1):
        if any(grid[line_index + point.y][column_index + point.x] != '.' for point in object_parts_points):
            continue

        putable_points.append(Point(line_index, column_index))

results = []

results.append(len(putable_points))

if len(putable_points) == 1:
    putable_point = putable_points[0]

    for object_parts_point in object_parts_points:
        y = putable_point.y + object_parts_point.y
        x = putable_point.x + object_parts_point.x

        grid[y][x] = '*'

    results.extend([''.join(line) for line in grid])

# print("answer")
for result in results:
    print(result)
