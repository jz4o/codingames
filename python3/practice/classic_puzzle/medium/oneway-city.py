# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

m = int(input())
n = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

distances = [m - 1, n - 1]

# one way city
if min(distances) <= 0:
    result = 1
else:
    mole_combination = 1
    for n in range(max(distances) + 1, sum(distances) + 1):
        mole_combination *= n

    deno_combination = 1
    for n in range(1, min(distances) + 1):
        deno_combination *= n

    movable_combination = mole_combination // deno_combination
    result = str(movable_combination)[:1000]

# print("answer")
print(result)
