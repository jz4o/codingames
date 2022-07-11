# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

r = int(input())
v = int(input())
robbers = [0] * r
for i in range(v):
    c, n = [int(j) for j in input().split()]

    vault_time = (10**n) * (5**(c - n))
    robbers[robbers.index(min(robbers))] += vault_time

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

result = max(robbers)

# print("1")
print(result)
