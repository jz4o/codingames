from __future__ import annotations

# import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w = int(input())
h = int(input())
first_rows = []
for _ in range(h):
    row = input()
    first_rows.append(row)
second_rows = []
for _ in range(h):
    row = input()
    second_rows.append(row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Duck:
    def __init__(self, id_value, coordinate, h, w):
        self.id = id_value
        self.first_row_index: int = coordinate['first_row_index']
        self.first_column_index: int = coordinate['first_column_index']
        self.second_row_index: int = coordinate['second_row_index']
        self.second_column_index: int = coordinate['second_column_index']

        self.move_y = self.second_row_index - self.first_row_index
        self.move_x = self.second_column_index - self.first_column_index

        keep_field_y = None
        if self.move_y > 0:
            keep_field_y = (h - self.first_row_index) // self.move_y
        if self.move_y < 0:
            keep_field_y = self.first_row_index // abs(self.move_y)
        keep_field_x = None
        if self.move_x > 0:
            keep_field_x = (w - self.first_column_index) // self.move_x
        if self.move_x < 0:
            keep_field_x = self.first_column_index // abs(self.move_x)

        self.keep_field: int | float = min(
            value
            for value
            in [keep_field_y, keep_field_x, math.inf]
            if value is not None
        )

    def distance_edge(self, turn, h, w):
        return min(
            self.column_index(turn),
            w - self.column_index(turn),
            self.row_index(turn),
            h - self.row_index(turn),
        )

    def row_index(self, turn):
        return self.first_row_index + (self.move_y * turn)

    def column_index(self, turn):
        return self.first_column_index + (self.move_x * turn)

coordinates = {}
for row_index, row in enumerate(first_rows):
    for column_index, value in enumerate(row):
        if value == '.':
            continue

        coordinates[value] = {
            'first_row_index': row_index,
            'first_column_index': column_index,
        }
for row_index, row in enumerate(second_rows):
    for column_index, value in enumerate(row):
        if value == '.':
            continue

        coordinates[value]['second_row_index'] = row_index
        coordinates[value]['second_column_index'] = column_index

ducks = [
    Duck(id_value, coordinate, h, w)
    for id_value, coordinate
    in coordinates.items()
]

ducks.sort(key=lambda duck: duck.keep_field)

results = []
for turn in range(2, len(ducks) + 2):
    target_keep_field = next(iter(duck.keep_field for duck in ducks if turn <= duck.keep_field), None)
    target_ducks = [duck for duck in ducks if duck.keep_field == target_keep_field]
    target_duck = next(iter(sorted(target_ducks, key=lambda duck: duck.distance_edge(turn, h, w))), None)

    if target_duck is None:
        continue

    results.append(f'{target_duck.id} {target_duck.column_index(turn)} {target_duck.row_index(turn)}')
    ducks.remove(target_duck)

# print("ID x y")
for result in results:
    print(result)
