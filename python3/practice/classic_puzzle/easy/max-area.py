# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
a_list: list[int] = []
for i in input().split():
    a = int(i)
    a_list.append(a)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

areas = []
for l_index, l in enumerate(a_list):
    for r_index, r in enumerate(a_list[l_index + 1:], start=l_index + 1):
        height = min(l, r)
        width = r_index - l_index

        areas.append(height * width)

result = max(areas)

# print("answer")
print(result)
