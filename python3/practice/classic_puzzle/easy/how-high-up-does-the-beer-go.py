# import sys
# import math

from math import pi, pow

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

bottom_radius, top_radius, glass_height, beer_vol = [float(i) for i in input().split()]

# Write an answer using prin
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


def calc_volume(bottom_radius, top_radius, height):
    return (1 / 3) * pi * height * (pow(bottom_radius, 2) + bottom_radius * top_radius + pow(top_radius, 2))


inclination = (top_radius - bottom_radius) / glass_height

min_height = 0
max_height = glass_height
temp_height = round(glass_height / 2, 1)

height_volume_dict = {}
while temp_height not in height_volume_dict:
    temp_top_radius = bottom_radius + temp_height * inclination
    volume = calc_volume(bottom_radius, temp_top_radius, temp_height)

    height_volume_dict[temp_height] = volume

    if volume < beer_vol:
        min_height = temp_height
        temp_height = round((temp_height + max_height) / 2, 1)
    else:
        max_height = temp_height
        temp_height = round((temp_height + min_height) / 2, 1)

sorted_height_volume = sorted(height_volume_dict.items(), key=lambda height_volume: abs(height_volume[-1] - beer_vol))
nearest_height_volume = next(iter(sorted_height_volume))
nearest_height = next(iter(nearest_height_volume))

result = round(nearest_height, 1)

# print("height of beer")
print(result)
