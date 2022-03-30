import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n, k = [int(i) for i in input().split()]

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

results = []
temps = [[i] for i in range(1, k + 1)]
while any(temps):
    temp = temps.pop()

    if sum(temp) == n:
        result = ' '.join(map(str, temp))
        results.append(result)
    elif sum(temp) < n:
        for i in range(1, k + 1):
            temps.append(temp + [i])

# print("answer")
for result in reversed(results):
    print(result)
