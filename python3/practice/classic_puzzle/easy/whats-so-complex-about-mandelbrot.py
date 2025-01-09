# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

c = input()
m = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

complex_c = complex(c.replace('i', 'j'))

f = 0
n = 0
while abs(f) < 2 and n < m:
    f = f**2 + complex_c
    n += 1

result = n

# print("answer")
print(result)
