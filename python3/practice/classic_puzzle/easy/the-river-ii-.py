# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

r_1 = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

result = 'NO'
for i in reversed(range(1, r_1 - 1)):
    if i + sum(map(int, str(i))) == r_1:
        result = 'YES'
        break

# print("YES|NO")
print(result)
