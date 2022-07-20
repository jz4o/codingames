# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w, h = [int(i) for i in input().split()]
start_row, start_col = [int(i) for i in input().split()]
n = int(input())
map_rows = []
for i in range(n):
    for j in range(h):
        map_row = input()
        map_rows.append(map_row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

EMPTY = '.'
WALL = '#'
TREASURE = 'T'

maps = []
for i in range(n):
    rows = map(list, map_rows[i * h:(i + 1) * h])
    maps.append(rows)

for index, rows in enumerate(maps):
    rows = [[EMPTY, *row, EMPTY] for row in rows]
    rows.insert(0, [EMPTY] * len(rows[0]))
    rows.append([EMPTY] * len(rows[0]))

    maps[index] = rows

paths = []
for rows in maps:
    current_row = start_row + 1
    current_col = start_col + 1

    path_count = 0
    while True:
        current = rows[current_row][current_col]
        rows[current_row][current_col] = EMPTY  # measures for loop
        path_count += 1

        if current == '^':
            current_row -= 1
        elif current == 'v':
            current_row += 1
        elif current == '<':
            current_col -= 1
        elif current == '>':
            current_col += 1
        else:
            break

    path = path_count if current == TREASURE else -1
    paths.append(path)

glory_maps = [[path, index] for index, path in enumerate(paths) if path > 0]

result = min(glory_maps)[-1] if len(glory_maps) > 0 else 'TRAP'

# print("mapIndex")
print(result)
