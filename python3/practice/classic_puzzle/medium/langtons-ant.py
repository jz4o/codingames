# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

MARKS = {'black': '#', 'white': '.'}
directions = ['N', 'E', 'S', 'W']

w, h = (int(i) for i in input().split())
x, y = (int(i) for i in input().split())
direction = input()
directions = directions[directions.index(direction):] + directions[:directions.index(direction)]
t = int(input())
grid = []
for _ in range(h):
    c = input()
    grid.append(list(c))
for _ in range(t):

    # Write an answer using print
    # To debug: print("Debug messages...", file=sys.stderr, flush=True)

    # print("answer")

    color_is_black = grid[y][x] == MARKS['black']
    if color_is_black:
        directions.append(directions.pop(0))
    else:
        directions.insert(0, directions.pop())
    grid[y][x] = MARKS['white'] if color_is_black else MARKS['black']

    if directions[0] == 'N':
        y -= 1
    elif directions[0] == 'E':
        x += 1
    elif directions[0] == 'W':
        x -= 1
    elif directions[0] == 'S':
        y += 1

results = map(''.join, grid)

for result in results:
    print(result)
