# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

l = int(input())
n = int(input())
bs = []
for i in input().split():
    b = int(i)
    bs.append(b)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

min_b = min(bs)
max_b = max(bs)

result = max(l - min_b, max_b)

# print("answer")
print(result)
