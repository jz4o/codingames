# import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

a, b = [int(i) for i in input().split()]

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

temp_a = a
temp_b = b

results = []
while True:
    r = temp_a % temp_b

    results.append(f'{temp_a}={temp_b}*{math.floor(temp_a / temp_b)}+{r}')

    temp_a = temp_b
    temp_b = r

    if r == 0:
        break

results.append(f'GCD({a},{b})={temp_a}')

# print("GCD(a,b)")
for result in results:
    print(result)
