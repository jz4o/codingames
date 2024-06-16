# import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w, h, t1, t2, t3 = (int(i) for i in input().split())
first_picture_rows = []
second_picture_rows = []
for _ in range(h):
    first_picture_row, second_picture_row = input().split()

    first_picture_rows.append(first_picture_row)
    second_picture_rows.append(second_picture_row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

position_dict = {mark: {} for mark in ''.join(first_picture_rows).replace('.', '')}

for row_index, row in enumerate(first_picture_rows):
    for char_index, char in enumerate(row):
        if char == '.':
            continue

        position_dict[char]['first'] = {'y': row_index, 'x': char_index}

for row_index, row in enumerate(second_picture_rows):
    for char_index, char in enumerate(row):
        if char == '.':
            continue

        position_dict[char]['second'] = {'y': row_index, 'x': char_index}

for position in position_dict.values():
    y_speed = (position['second']['y'] - position['first']['y']) / (t2 - t1)
    x_speed = (position['second']['x'] - position['first']['x']) / (t2 - t1)

    third_y = position['second']['y'] + math.floor(y_speed * (t3 - t2))
    third_x = position['second']['x'] + math.floor(x_speed * (t3 - t2))

    position['third'] = {'y': None, 'x': None}
    if 0 <= third_y <= h - 1:
        position['third']['y'] = third_y
    if 0 <= third_x <= w - 1:
        position['third']['x'] = third_x

third_picture_rows = [['.'] * w for _ in range(h)]
for mark in sorted(position_dict, reverse=True):
    position = position_dict[mark]

    if position['third']['y'] is None or position['third']['x'] is None:
        continue

    third_picture_rows[position['third']['y']][position['third']['x']] = mark

results = [''.join(row) for row in third_picture_rows]

# print("answer")
for result in results:
    print(result)
