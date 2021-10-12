import sys
import math

from fractions import Fraction

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

nf = Fraction(1, n)

results = []
for y in range(n + 1, n * 2 + 1):
    yf = Fraction(1, y)
    xf = nf - yf
    if xf.numerator != 1 or yf < xf:
        continue

    results.append(f'{nf} = {xf} + {yf}')

# print("1/n = 1/x + 1/y")
for result in results:
    print(result)
