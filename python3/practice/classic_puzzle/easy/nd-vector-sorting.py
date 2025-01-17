# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

d = int(input())
n = int(input())
ords = []
for i in input().split():
    _ord = int(i)
    ords.append(_ord)
coord_rows = []
for _ in range(n):
    coord_row = []
    for j in input().split():
        coord = int(j)
        coord_row.append(coord)
    coord_rows.append(coord_row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Vector:
    def __init__(self, id_value, coordinates):
        self.id = id_value
        self.coordinates = coordinates

vectors = [Vector(id_value, coord_row) for id_value, coord_row in enumerate(coord_rows, start=1)]
vectors.sort(key=lambda vector: [vector.coordinates[ord_value - 1] for ord_value in ords])

result = ' '.join(str(vector.id) for vector in vectors)

# print("answer")
print(result)
