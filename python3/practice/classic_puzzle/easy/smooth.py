# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
fs = []
for _ in range(n):
    f = int(input())
    fs.append(f)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

results = []
for temp_f in fs:
    f = temp_f
    for i in [5, 3, 2]:
        while f % i == 0:
            f /= i

    results.append('VICTORY' if f == 1 else 'DEFEAT')

# print("DEFEAT")
for result in results:
    print(result)
