import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

r_1 = int(input())
r_2 = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

while r_1 != r_2:
    if r_1 < r_2:
        r_1 += sum(map(int, str(r_1)))
    else:
        r_2 += sum(map(int, str(r_2)))

# print("42")
print(r_1)
