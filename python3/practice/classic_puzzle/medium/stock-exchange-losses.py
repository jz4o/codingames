# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
values = []
for i in input().split():
    v = int(i)

    values.append(v)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

max_value = 0
max_diff = 0
for index, value in enumerate(values):
    if index >= len(values) - 1:
        break

    if max_value >= value:
        continue

    max_value = value

    diff = min(values[index + 1:]) - value
    max_diff = min(diff, max_diff)

# print("answer")
print(max_diff)
