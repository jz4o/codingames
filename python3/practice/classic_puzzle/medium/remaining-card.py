# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

base = 2
step = 2
max_num = n
while base < max_num:
    prev_max = max_num
    max_num = int((max_num - base) / step) * step + base

    if prev_max == max_num:
        base += step

    step *= 2

# print("answer")
print(max_num)
