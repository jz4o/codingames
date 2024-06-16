# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())

result = 0
for side_length in range(n, 0, -2):
    base = n**2 - side_length**2 + 1
    result += base if side_length <= 1 else sum([i * (side_length - 1) + base for i in range(4)])

print(result)
