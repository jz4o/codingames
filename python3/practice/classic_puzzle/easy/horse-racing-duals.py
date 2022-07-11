# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
pis = []
for i in range(n):
    pi = int(input())
    pis.append(pi)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

result = 10000000 - 0
pis = sorted(pis)
for index in range(len(pis) - 1):
    n = pis[index]
    m = pis[index + 1]

    diff = m - n

    result = min(result, diff)

# print("answer")
print(result)
