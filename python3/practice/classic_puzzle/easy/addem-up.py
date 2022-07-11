# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
integers = []
for i in input().split():
    x = int(i)

    integers.append(x)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

total_cost = 0
while len(integers) >= 2:
    integers.sort()

    first_integer = integers.pop(0)
    second_integer = integers.pop(0)

    cost = first_integer + second_integer

    total_cost += cost

    integers.append(cost)

# print("0")
print(total_cost)
