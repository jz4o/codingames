# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

hi, wi = [int(i) for i in input().split()]
style = input()
how_many_triangles = int(input())
triangle_rows = []
for _ in range(how_many_triangles):
    x_1, y_1, x_2, y_2, x_3, y_3 = [int(j) for j in input().split()]

    triangle_rows.append([x_1, y_1, x_2, y_2, x_3, y_3])

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Point:
    def __init__(self, y, x):
        self.y = y
        self.x = x

grid = [[0] * wi for _ in range(hi)]

y_range = range(hi)
x_range = range(wi)

for x_1, y_1, x_2, y_2, x_3, y_3 in triangle_rows:
    points = [Point(y_1, x_1), Point(y_2, x_2), Point(y_3, x_3)]

    if len({point.y for point in points}) == 2:
        ordered_points = sorted(points, key=lambda point: [point.y, point.x])
        horizontal_y = ordered_points[1].y
        horizontal_left_point, horizontal_right_point = [point for point in ordered_points if point.y == horizontal_y]
        different_y_point = next(iter(point for point in points if point.y != horizontal_y))

        clination_left = 0 if different_y_point.x == horizontal_left_point.x else 1
        clination_right = 0 if different_y_point.x == horizontal_right_point.x else 1

        y_start = different_y_point.y
        y_stop = horizontal_y + (1 if different_y_point.y < horizontal_y else -1)
        y_step = 1 if different_y_point.y < horizontal_y else -1
        for index, y in enumerate(range(y_start, y_stop, y_step)):
            if y not in y_range:
                continue

            x_start = different_y_point.x - clination_left * index
            x_stop = different_y_point.x + clination_right * index + 1
            for x in range(x_start, x_stop):
                if x not in x_range:
                    continue

                grid[y][x] += 1
    else:
        ordered_points = sorted(points, key=lambda point: [point.x, point.y])
        vertical_x = ordered_points[1].x
        different_x_point = next(iter(point for point in points if point.x != vertical_x))

        x_start = different_x_point.x
        x_stop = vertical_x + (1 if different_x_point.x < vertical_x else -1)
        x_step = 1 if different_x_point.x < vertical_x else -1
        for index, x in enumerate(range(x_start, x_stop, x_step)):
            if x not in x_range:
                continue

            y_start = different_x_point.y - index
            y_stop = different_x_point.y + index + 1
            for y in range(y_start, y_stop):
                if y not in y_range:
                    continue

                grid[y][x] += 1

results = [
    (' ' if style == 'expanded' else '').join('*' if value % 2 == 0 else ' ' for value in row)
    for row
    in grid
]

# print("rectangleWithCarvings")
for result in results:
    print(result)
