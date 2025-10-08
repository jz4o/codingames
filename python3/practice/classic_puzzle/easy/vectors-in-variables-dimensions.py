# import sys

import math
import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

d = int(input())
n = int(input())
point_rows = []
for _ in range(n):
    point = input()
    point_rows.append(point)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Point:
    def __init__(self, name, components):
        self.name = name
        self.components = components

class Vector:
    def __init__(self, distance, text):
        self.distance = distance
        self.text = text

points = []
for point_row in point_rows:
    name, components_str = next(iter(re.findall(r'(.*?)\((.*?)\)', point_row)))
    components = [int(component_str) for component_str in components_str.split(',')]

    points.append(Point(name, components))

vectors = []
for left_index in range(n):
    for right_index in range(left_index + 1, n):
        left_point = points[left_index]
        right_point = points[right_index]

        component_distances = [
            r - l
            for (l, r)
            in zip(left_point.components, right_point.components, strict=True)
        ]
        distance = math.sqrt(sum(d**2 for d in component_distances))

        text = f'{left_point.name}{right_point.name}({",".join([str(d) for d in component_distances])})'

        vectors.append(Vector(distance, text))

results = [
   min(vectors, key=lambda vector: vector.distance).text,
   max(vectors, key=lambda vector: vector.distance).text,
]

# print("shortest_vector")
# print("longest_vector")
for result in results:
    print(result)
