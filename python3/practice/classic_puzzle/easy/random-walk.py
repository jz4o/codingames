# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

a = int(input())
b = int(input())
m = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

# D[0] = 0
d_results = [0]

u = 0
r = 0
step = 0
while True:
    step += 1

    d = (a * d_results[step - 1] + b) % m
    d_results.append(d)

    mod = d % 4
    if mod == 0:
        u += 1
    elif mod == 1:
        u -= 1
    elif mod == 2:
        r -= 1
    elif mod == 3:
        r += 1

    if all([i == 0 for i in [u, r]]):
        break

result = step

# print("result")
print(result)
