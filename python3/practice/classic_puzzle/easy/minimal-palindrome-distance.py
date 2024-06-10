# import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
s = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

result = None
for i in range(n):
    front = s[:math.ceil((n + i) / 2) - 1]
    back = s[-(n - math.ceil((n + i) / 2)):]

    reversed_back = back[::-1]

    if front.endswith(reversed_back):
        result = i
        break

# print("answer")
print(result)
