# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

start, n = (int(i) for i in input().split())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

result = start
for _ in range(n):
    temp = len(format(result, 'b').replace('0', 'zero').replace('1', 'one'))
    if result == temp:
        break

    result = temp

# print("42")
print(result)
