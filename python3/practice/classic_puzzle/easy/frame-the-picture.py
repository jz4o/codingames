# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

frame_pattern = input()  # the ASCII art pattern to use to frame the picture
# h: the height of the picture
# w: the width  of the picture
h, w = (int(i) for i in input().split())
lines = []
for _ in range(h):
    line = input()  # the ASCII art picture line by line

    lines.append(line)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


def surround(grid, char):
    return [
        [char] * (len(grid[0]) + 2),
        *[[char, *row, char] for row in grid],
        [char] * (len(grid[0]) + 2),
    ]


grid = [list(line.ljust(w)) for line in lines]
for frame_char in reversed(frame_pattern + ' '):
    grid = surround(grid, frame_char)

results = [''.join(row) for row in grid]

# print("Write framed picture line by line here")
for result in results:
    print(result)
