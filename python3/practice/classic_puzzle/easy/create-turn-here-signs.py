# import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

_input = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

input_elements = _input.split()
direction = input_elements.pop(0)
[
    how_many_arrows,
    height_of_arrows,
    stroke_thickness_of_arrows,
    spacing_between_arrows,
    additional_indent_of_each_line,
] = map(int, input_elements)

results = []
for index in range(height_of_arrows):
    direction_is_right = direction == 'right'

    arrow_parts = ('>' if direction_is_right else '<') * stroke_thickness_of_arrows

    space_parts = ' ' * spacing_between_arrows

    center_row_index = math.floor(height_of_arrows / 2)
    diff_from_center_row_index = abs(center_row_index - index)
    if direction_is_right:
        indent_nest_size = center_row_index - diff_from_center_row_index
    else:
        indent_nest_size = diff_from_center_row_index

    indent_parts = ' ' * (additional_indent_of_each_line * indent_nest_size)

    results.append(indent_parts + space_parts.join([arrow_parts] * how_many_arrows))

# print("The Turn Here Sign")
for result in results:
    print(result)
