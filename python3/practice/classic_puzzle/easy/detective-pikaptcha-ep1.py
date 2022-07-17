# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

width, height = [int(i) for i in input().split()]
lines = []
for i in range(height):
    line = input()
    lines.append(line)
results = []
for h in range(height):

    # Write an action using print
    # To debug: print("Debug messages...", file=sys.stderr, flush=True)

    result = ''
    for w in range(width):
        value = lines[h][w]
        if value == '#':
            result += value
            continue

        around_chars = []
        if h != 0:
            around_chars.append(lines[h - 1][w])
        if w != 0:
            around_chars.append(lines[h][w - 1])
        if w + 1 != width:
            around_chars.append(lines[h][w + 1])
        if h + 1 != height:
            around_chars.append(lines[h + 1][w])
        result += str(around_chars.count('0'))

    # print("#####")
    results.append(result)

for result in results:
    print(result)
