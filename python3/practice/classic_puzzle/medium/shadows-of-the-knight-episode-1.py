import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# w: width of the building.
# h: height of the building.
w, h = [int(i) for i in input().split()]
n = int(input())  # maximum number of turns before game over.
x0, y0 = [int(i) for i in input().split()]

bomb_min_height = h
bomb_max_height = 0
bomb_min_width = 0 # to left
bomb_max_width = w # to right

# game loop
while True:
    bomb_dir = input()  # the direction of the bombs from batman's current location (U, UR, R, DR, D, DL, L or UL)

    # Write an action using print
    # To debug: print("Debug messages...", file=sys.stderr, flush=True)

    if 'U' in bomb_dir:
        bomb_min_height = y0
        y0 -= math.ceil((y0 - bomb_max_height) / 2)
    elif 'D' in bomb_dir:
        bomb_max_height = y0
        y0 += math.ceil((bomb_min_height - y0) / 2)

    if 'R' in bomb_dir:
        bomb_min_width = x0
        x0 += math.ceil((bomb_max_width - x0) / 2)
    elif 'L' in bomb_dir:
        bomb_max_width = x0
        x0 -= math.ceil((x0 - bomb_min_width) / 2)

    # the location of the next window Batman should jump to.
    # print("0 0")
    print(f'{x0} {y0}')
