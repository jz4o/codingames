# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# w: number of columns.
# h: number of rows.
w, h = (int(i) for i in input().split())
lines = []
for _ in range(h):
    # represents a line in the grid and contains W integers. Each integer represents one room of a given type.
    line = input()
    lines.append(line)
ex = int(input())  # the coordinate along the X axis of the exit (not useful for this first mission, but must be read).

TOP = 0
LEFT = 1
RIGHT = 2
BOTTOM = 3

PANEL_DESTINATION = {
    'TOP': [None, BOTTOM, None, BOTTOM, LEFT, RIGHT, None, BOTTOM, None, BOTTOM, LEFT, RIGHT, None, None],
    'LEFT': [None, BOTTOM, RIGHT, None, None, BOTTOM, RIGHT, None, BOTTOM, BOTTOM, None, None, None, BOTTOM],
    'RIGHT': [None, BOTTOM, LEFT, None, BOTTOM, None, LEFT, BOTTOM, BOTTOM, None, None, None, BOTTOM, None],
}

grid = [line.split() for line in lines]

# game loop
while True:
    inputs = input().split()
    xi = int(inputs[0])
    yi = int(inputs[1])
    pos = inputs[2]

    # Write an action using print
    # To debug: print("Debug messages...", file=sys.stderr, flush=True)

    panel_type = int(grid[yi][xi])
    next_dest = PANEL_DESTINATION[pos][panel_type]

    if next_dest == LEFT:
        xi -= 1
    elif next_dest == RIGHT:
        xi += 1
    elif next_dest == BOTTOM:
        yi += 1

    result = f'{xi} {yi}'

    # One line containing the X Y coordinates of the room in which you believe Indy will be on the next turn.
    # print("0 0")
    print(result)
