import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

l = int(input())
h = int(input())
t = input()
rows = []
for i in range(h):
    row = input()

    rows.append(row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

ALPHAS = list('ABCDEFGHIJKLMNOPQRSTUVWXYZ?')
result = [''] * h

for c in t.upper():
    i = ALPHAS.index(c) if c in ALPHAS else len(ALPHAS) - 1
    for r in range(h):
        result[r] += rows[r][l * i:l * i + l]

# print("answer")
for row in result:
    print(row)
