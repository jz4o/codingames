import sys
import math

import itertools

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

number = int(input())
d = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

digits = list(map(int, str(number)))

result = 0
for size in reversed(range(len(digits) - 2, len(digits) + 1)):
    combinations = itertools.combinations(digits, size)
    numbers = [int(''.join(map(str, c))) for c in combinations]
    numbers = [n for n in set(numbers) if n % d == 0]

    if len(numbers) > 0:
        result = max(numbers)
        break

# print("answer")
print(result)
