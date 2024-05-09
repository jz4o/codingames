# import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
input_rows = []
for i in range(n):
    row, col, is_white = [int(j) for j in input().split()]
    input_rows.append([row, col, is_white])

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

results = []
for row, col, is_white in input_rows:
    row_pattern_size = row - 7
    col_pattern_size = col - 7

    pattern_size = row_pattern_size * col_pattern_size

    round = math.floor if is_white == 0 else math.ceil

    results.append(round(pattern_size / 2))

# print("answer")
for result in results:
    print(result)
