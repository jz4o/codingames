# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

side_size = int(input())
rows = []
for _ in range(side_size):
    row = input()
    rows.append(row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

quad_values = [0] * 4
for row_index, row in enumerate(rows):
    for value_index, value in enumerate(row):
        if value == '.':
            continue

        quad_index = (row_index // (side_size // 2) * 2) + (value_index // (side_size // 2))
        quad_values[quad_index] += int(value)

standard_value = sorted(quad_values)[1]
odd_value = next(iter(set(quad_values) - {standard_value}))
odd_quad = quad_values.index(odd_value) + 1

results = [
    f'Quad-{odd_quad} is Odd-Quad-Out',
    f'It has value of {odd_value}',
    f'Others have value of {standard_value}',
]

# print("the number of the Odd Quadrant Out")
# print("write value of the Odd Quadrant Out")
# print("write value of the other Quadrants")
for result in results:
    print(result)
