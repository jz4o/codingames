import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

cube_count = n**3
invisible_cube_count = max(n - 2, 0)**3

# print("answer")
print(cube_count - invisible_cube_count)
