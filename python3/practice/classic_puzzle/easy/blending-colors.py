from __future__ import annotations

# import sys
import math
from decimal import ROUND_HALF_UP, Decimal

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

s, p = [int(i) for i in input().split()]
lines = []
for _ in range(s):
    line = input()
    lines.append(line)
xys = []
for _ in range(p):
    x, y = [int(j) for j in input().split()]
    xys.append((x, y))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

def precise_round_div(dividend: float, divisor: float, ndigits: int | None = None) -> float:
    div_decimal = Decimal(str(dividend)) / Decimal(str(divisor))

    if ndigits is None:
        return float(div_decimal)

    adjust_decimal = Decimal(str(10 ** -ndigits))
    rounded_decimal = (div_decimal / adjust_decimal).quantize(Decimal(0), ROUND_HALF_UP) * adjust_decimal

    return float(rounded_decimal)

class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.colors = []

    def add_color(self, color):
        self.colors.append(color)

    def color(self):
        return self.__mix_colors()

    def __mix_colors(self):
        if len(self.colors) == 0:
            return Color.WHITE
        if any(color for color in self.colors if color.is_black()):
            return Color.BLACK

        r = int(precise_round_div(sum(c.r for c in self.colors), len(self.colors), 0))
        g = int(precise_round_div(sum(c.g for c in self.colors), len(self.colors), 0))
        b = int(precise_round_div(sum(c.b for c in self.colors), len(self.colors), 0))

        return Color(r, g, b)

class Color:
    BLACK: Color
    WHITE: Color

    def __init__(self, r, g, b):
        self.r = r
        self.g = g
        self.b = b

    def is_black(self):
        return all(c == 0 for c in [self.r, self.g, self.b])

    def __str__(self):
        return f'({self.r}, {self.g}, {self.b})'
Color.BLACK = Color(0, 0, 0)
Color.WHITE = Color(255, 255, 255)

points = [Point(x, y) for x, y in xys]

for line in lines:
    name, x, y, length, r, g, b = line.split()
    x, y, length, r, g, b = map(int, [x, y, length, r, g, b])
    c = Color(r, g, b)

    if name == 'SQUARE':
        min_x = x
        max_x = x + length
        min_y = y
        max_y = y + length

        for point in [point for point in points if min_x <= point.x <= max_x and min_y <= point.y <= max_y]:
            color = Color.BLACK if point.x in [min_x, max_x] or point.y in [min_y, max_y] else c
            point.add_color(color)

    elif name == 'CIRCLE':
        min_x = x - length
        max_x = x + length
        min_y = y - length
        max_y = y + length

        for point in [point for point in points if min_x <= point.x <= max_x and min_y <= point.y <= max_y]:
            diff_x = abs(x - point.x)
            diff_y = abs(y - point.y)
            radius = math.sqrt(diff_x**2 + diff_y**2)

            if length < radius:
                continue

            color = Color.BLACK if length == radius else c
            point.add_color(color)

results = [str(point.color()) for point in points]

# print("answer")
for result in results:
    print(result)

