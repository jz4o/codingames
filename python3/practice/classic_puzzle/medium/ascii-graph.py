# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.


class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y


n = int(input())
points = []
xs = [0]
ys = [0]
for i in range(n):
    x, y = [int(j) for j in input().split()]

    points.append(Point(x, y))
    xs.append(x)
    ys.append(y)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

y_plus_length = abs(max(ys)) + 1
y_minus_length = abs(min(ys)) + 1
x_plus_length = abs(max(xs)) + 1
x_minus_length = abs(min(xs)) + 1

y_length = y_plus_length + y_minus_length + 1
x_length = x_plus_length + x_minus_length + 1
grid = [['.'] * x_length for i in range(y_length)]

zero_point = Point(x_minus_length, y_plus_length)

grid[zero_point.y] = ['-'] * x_length
for row in grid:
    row[zero_point.x] = '|'
grid[zero_point.y][zero_point.x] = '+'

for point in points:
    grid[zero_point.y - point.y][zero_point.x + point.x] = '*'

# print("answer")
for row in grid:
    print(''.join(row))
