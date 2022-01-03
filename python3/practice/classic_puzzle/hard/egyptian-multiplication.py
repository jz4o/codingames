import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

a, b = [int(i) for i in input().split()]

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

high = max(a, b)
low = min(a, b)

results = []
results.append(f'{high} * {low}')

add_nums = ''
while low != 0:
    if low % 2 == 0:
        high *= 2
        low //= 2
    else:
        add_nums += f' + {high}'
        low -= 1

    results.append(f'= {high} * {low}{add_nums}')

results.append(f'= {a * b}')

# print("answer")
for result in results:
    print(result)
