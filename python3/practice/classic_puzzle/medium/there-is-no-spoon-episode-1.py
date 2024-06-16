# import sys
# import math

# Don't let the machines win. You are humanity's last hope...

width = int(input())  # the number of cells on the X axis
height = int(input())  # the number of cells on the Y axis
lines = []
for _ in range(height):
    line = input()  # width characters, each either 0 or .

    lines.append(line)

# Write an action using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

results = []
for h in range(height):
    for w in range(width):
        if lines[h][w] == '.':
            continue

        result = f'{w} {h} '

        for r in range(w + 1, width + 1):
            if len(lines[h]) <= r:
                result += '-1 -1 '
                break
            elif lines[h][r] == '0':
                result += f'{r} {h} '
                break

        for b in range(h + 1, height + 1):
            if len(lines) <= b:
                result += '-1 -1 '
                break
            elif lines[b][w] == '0':
                result += f'{w} {b}'
                break

        results.append(result)


# Three coordinates: a node, its right neighbor, its bottom neighbor
# print("0 0 1 0 0 1")
for result in results:
    print(result)
