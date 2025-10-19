# import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

side, diameter = (float(i) for i in input().split())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

all_area_size = side**2
circle_area_size = (diameter / 2)**2 * math.pi

wasteful_circle_count = int((side // diameter)**2)

remain_area_size = all_area_size - (circle_area_size * wasteful_circle_count)

frugal_circle_count = wasteful_circle_count

remain_side = math.sqrt(remain_area_size)
while diameter <= remain_side:
    add_circle_count = int((remain_side // diameter)**2)

    remain_area_size -= circle_area_size * add_circle_count
    frugal_circle_count += add_circle_count

    remain_side = math.sqrt(remain_area_size)

result = frugal_circle_count - wasteful_circle_count

# print("how many more biscuit")
print(result)
