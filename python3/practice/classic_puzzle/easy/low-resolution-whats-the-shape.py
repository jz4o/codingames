# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w, h = (int(i) for i in input().split())
rows = []
for _ in range(h):
    row = input()
    rows.append(row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

pixels = ''.join(rows)
points = pixels.count('X') + len([pixel for pixel in pixels if pixel not in ('.', 'X')]) // 2

pixel_size = w * h
result = None
if points == pixel_size:
    result = 'Rectangle'
elif points > pixel_size // 2:
    result = 'Ellipse'
else:
    result = 'Triangle'

# print("Rectangle/Triangle/Ellipse")
print(result)
