# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n, m = (int(i) for i in input().split())
xs = []
for i in input().split():
    x = int(i)
    xs.append(x)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

xs.sort()

result = min([xs[i + m - 1] - xs[i] for i in range(len(xs) - m + 1)])

# print("answer")
print(result)
