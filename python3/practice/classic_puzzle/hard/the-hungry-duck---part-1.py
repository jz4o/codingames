# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w, h = [int(i) for i in input().split()]
grid = []
for i in range(h):
    row = []
    for j in input().split():
        food = int(j)
        row.append(food)
    grid.append(row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

for height in range(h):
    for width in range(w):
        top = 0 if height == 0 else grid[height - 1][width]
        left = 0 if width == 0 else grid[height][width - 1]

        grid[height][width] += max(top, left)

# print("answer")
print(grid[-1][-1])
