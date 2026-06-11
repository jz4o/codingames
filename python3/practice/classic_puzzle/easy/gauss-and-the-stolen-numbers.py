# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
s = int(input())
q = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

diff_sum = sum(range(1, n + 1)) - s
diff_square = sum(i**2 for i in range(1, n + 1)) - q

min_missing_number, max_missing_number = next(
    (i, j)
    for i in range(1, (diff_sum // 2) + 1)
    if i**2 + (j := diff_sum - i)**2 == diff_square
)

result = f'{min_missing_number} {max_missing_number}'

# print("answer")
print(result)
