import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

x, y = [int(i) for i in input().split()]
u, v = [int(i) for i in input().split()]

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

x_distance = min(abs(x - u), 200 - abs(x - u))
y_distance = min(abs(y - v), 150 - abs(y - v))

result = 0
result += min(x_distance, y_distance) * 0.5
result += abs(y_distance - x_distance) * (0.4 if x_distance < y_distance else 0.3)

result = round(result, 1)

# print("0.0")
print(result)
