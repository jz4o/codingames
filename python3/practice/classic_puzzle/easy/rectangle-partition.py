import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w, h, count_x, count_y = [int(i) for i in input().split()]
width_measurements = [0]
for i in input().split():
    x = int(i)
    width_measurements.append(x)
width_measurements.append(w)
height_measurements = [0]
for i in input().split():
    y = int(i)
    height_measurements.append(y)
height_measurements.append(h)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

width_counts = {}
for index, width_measurement in enumerate(width_measurements):
    for width in width_measurements[:index]:
        k = width_measurement - width
        if k not in width_counts:
            width_counts[k] = 0

        width_counts[k] += 1

height_counts = {}
for index, height_measurement in enumerate(height_measurements):
    for height in height_measurements[:index]:
        k = height_measurement - height
        if k not in height_counts:
            height_counts[k] = 0
        height_counts[k] += 1

for k in width_counts:
    if k not in height_counts:
        height_counts[k] = 0

result = sum([width_counts[k] * height_counts[k] for k in width_counts.keys()])

# print("0")
print(result)
