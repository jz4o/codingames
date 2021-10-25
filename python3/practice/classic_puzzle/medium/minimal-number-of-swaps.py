import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
xs = []
for i in input().split():
    x = int(i)

    xs.append(x)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

l_index = -1
r_index = len(xs)
turn = 0
while l_index < r_index:
    l_index += 1
    while l_index < len(xs) and xs[l_index] != 0:
        l_index += 1

    r_index -= 1
    while r_index >= 0 and xs[r_index] != 1:
        r_index -= 1

    turn += 1

# print("answer")
print(turn - 1)
