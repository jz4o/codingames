# import sys
import math
import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

a, b, c = (float(i) for i in input().split())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class Point:
    DECIMALS_DIGITS = 2

    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __str__(self):
        formatted_x = re.sub(r'\.?0+$', '', str(round(self.x, self.__class__.DECIMALS_DIGITS)))
        formatted_y = re.sub(r'\.?0+$', '', str(round(self.y, self.__class__.DECIMALS_DIGITS)))

        return f'({formatted_x},{formatted_y})'


delta = b**2 - (4 * a * c)

points = []

# x axis
if a != 0 or b != 0:
    if a == 0:
        points.append(Point(-c / b, 0.0))
    elif delta == 0:
        points.append(Point(-b / (2 * a), 0.0))
    elif delta > 0:
        points.append(Point((-b + math.sqrt(delta)) / (2 * a), 0.0))
        points.append(Point((-b - math.sqrt(delta)) / (2 * a), 0.0))

# y axis
points.append(Point(0.0, c))

result = ','.join(map(str, sorted(points, key=lambda point: [point.x, point.y])))

# print("(X1,Y1),...,(Xn,Yn)")
print(result)
