# import sys
# import math

import re
from functools import reduce

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

a_speed = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

DISTANCE_CONVERTERS = [
    {'name': 'miles', 'rate': 1},
    {'name': 'furlongs', 'rate': 8},
    {'name': 'chains', 'rate': 10},
    {'name': 'yards', 'rate': 22},
    {'name': 'feet', 'rate': 3},
    {'name': 'inches', 'rate': 12},
]

UNIT_CONVERTERS = [
    {'name': 'fortnights', 'rate': 1},
    {'name': 'weeks', 'rate': 2},
    {'name': 'days', 'rate': 7},
    {'name': 'hours', 'rate': 24},
    {'name': 'minutes', 'rate': 60},
    {'name': 'seconds', 'rate': 60},
]


def get_dist_index(dist):
    return next(iter([
        index
        for index, converter
        in enumerate(DISTANCE_CONVERTERS)
        if re.fullmatch(f'{dist}s?', converter['name']) is not None
    ]))


def calc_distance_rate(begin_index, end_index):
    return reduce(
        lambda mul, index: mul * DISTANCE_CONVERTERS[index]['rate'],
        range(begin_index, end_index),
        1,
    )


def get_unit_index(time):
    return next(iter([
        index
        for index, converter
        in enumerate(UNIT_CONVERTERS)
        if re.fullmatch(f'{time}s?', converter['name']) is not None
    ]))


def calc_unit_rate(begin_index, end_index):
    return reduce(
        lambda mul, index: mul * UNIT_CONVERTERS[index]['rate'],
        range(begin_index, end_index),
        1,
    )


a_speed_pattern = r'(\d+)\s(.*)\sper\s(.*)\sCONVERT\sTO\s(.*)\sper\s(.*)'
speed, dist1, time1, dist2, time2 = next(iter(re.findall(a_speed_pattern, a_speed)))

from_dist_index = get_dist_index(dist1)
to_dist_index = get_dist_index(dist2)
if from_dist_index < to_dist_index:
    distance_rate = calc_distance_rate(from_dist_index + 1, to_dist_index + 1)
elif from_dist_index == to_dist_index:
    distance_rate = 1
else:
    distance_rate = 1 / calc_distance_rate(to_dist_index + 1, from_dist_index + 1)

from_unit_index = get_unit_index(time1)
to_unit_index = get_unit_index(time2)
if from_unit_index < to_unit_index:
    unit_rate = calc_unit_rate(from_unit_index + 1, to_unit_index + 1)
elif from_unit_index == to_unit_index:
    unit_rate = 1
else:
    unit_rate = 1 / calc_unit_rate(to_unit_index + 1, from_unit_index + 1)

to_speed = round(int(speed) * distance_rate / unit_rate, 1)

result = f'{to_speed} {dist2} per {time2}'

# print("The Converted Speed")
print(result)
