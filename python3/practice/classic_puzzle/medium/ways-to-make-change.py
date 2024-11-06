# import sys
# import math
from collections import defaultdict

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
s = int(input())
vis: list[int] = []
for i in input().split():
    vi = int(i)
    vis.append(vi)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

counter: dict[int, int] = { 0: 1 }
for vi in sorted(vis, reverse=True):
    next_counter = defaultdict(int)

    for value, count in counter.items():
        for vi_count in sorted(range(((n - value) // vi) + 1), reverse=True):
            next_counter[value + (vi * vi_count)] += count

    counter = next_counter

result = counter[n]

# print("answer")
print(result)
