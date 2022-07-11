# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

h = int(input())
grid = []
for i in range(h):
    s = input()
    grid.append(list(s))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


def is_stable(grid):
    left_part = '/'
    right_part = '\\'
    part_empty = '.'

    height = len(grid)
    width = len(grid[0])

    for h in range(height):
        is_bottom_row = h == height - 1

        for w in range(width):
            card = grid[h][w]
            if card == part_empty:
                continue

            is_right_part = card == right_part
            side_card = None
            if is_right_part and w != 0:
                side_card = grid[h][w - 1]
            elif w != width - 1:
                side_card = grid[h][w + 1]
            partner_part = left_part if is_right_part else right_part

            check_side_card = side_card == partner_part
            check_under_card = is_bottom_row or grid[h + 1][w] == partner_part

            if not check_side_card or not check_under_card:
                return False

    return True


result = 'STABLE' if is_stable(grid) else 'UNSTABLE'

# print("UNSTABLE")
print(result)
