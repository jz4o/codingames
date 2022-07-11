# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w, h = [int(i) for i in input().split()]
grid = []
for i in range(h):
    line = input()

    grid.append([' ', *line.replace('--', '-').replace('  ', ' ')])

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

top_row = grid.pop(0)
bottom_row = grid.pop()
for row in reversed(grid):
    for column_index, char in enumerate(row):
        if char == '-':
            bottom_row[column_index - 1:column_index + 2] = reversed(bottom_row[column_index - 1:column_index + 2])

results = [top_char + bottom_char for top_char, bottom_char in zip(top_row, bottom_row) if top_char != ' ']

# print("answer")
for result in results:
    print(result)
