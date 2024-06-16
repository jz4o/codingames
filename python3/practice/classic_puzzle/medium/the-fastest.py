# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
ts = []
for _ in range(n):
    t = input()

    ts.append(t)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

result = sorted(ts)[0]

# print("answer")
print(result)
