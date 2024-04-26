# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

height = int(input())
width = int(input())
number_of_shelves = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

top_left_parts = '/' * int(width / 2)
top_center_parts = '^' * (width % 2)
top_right_parts = '\\' * int(width / 2)
top = f'{top_left_parts}{top_center_parts}{top_right_parts}'

shelf_space_parts = f'|{" " * (width - 2)}|'
shelf_bottom_parts = f'|{"_" * (width - 2)}|'
shelf_space_parts_count = int((height - 1) / number_of_shelves) - 1
normal_shelf = ([shelf_space_parts] * shelf_space_parts_count) + [shelf_bottom_parts]

expand_shelf = [shelf_space_parts, *normal_shelf]

expand_shelf_count = (height - 1) % number_of_shelves
normal_shelf_count = number_of_shelves - expand_shelf_count

normal_shelves = sum([normal_shelf] * normal_shelf_count, [])
expand_shelves = sum([expand_shelf] * expand_shelf_count, [])

results = [top, *normal_shelves, *expand_shelves]

# print("the Bookcase")
for result in results:
    print(result)
