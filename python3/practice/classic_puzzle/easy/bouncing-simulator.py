# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w = int(input())
h = int(input())
n = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

grid = [['#', *[0] * w, '#'] for _ in range(h)]
grid.insert(0, ['#'] * (w + 2))
grid.append(['#'] * (w + 2))

position_y = 1
position_x = 1

grid[position_y][position_x] += 1

move_y = 1
move_x = 1
hit_count = 0
while hit_count < n:
    next_y = position_y + move_y
    next_x = position_x + move_x

    is_overflow_y = not 1 <= next_y <= h
    is_overflow_x = not 1 <= next_x <= w
    if is_overflow_y or is_overflow_x:
        hit_count += 1

        if is_overflow_y:
            move_y *= -1

            if h == 1:
                position_y = next_y

        if is_overflow_x:
            move_x *= -1

            if w == 1:
                position_x = next_x

        continue

    position_y = next_y
    position_x = next_x

    grid[position_y][position_x] += 1

results = [
    ''.join(' ' if cell == 0 else str(cell) for cell in row)
    for row
    in grid
]

# print("Grid after n hits")
for result in results:
    print(result)
