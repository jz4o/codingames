# import sys
# import math

import itertools

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

numbers: list[int] = [1]
count = 1
while n not in numbers:
    next_numbers = itertools.chain.from_iterable([[number, number + 1, number - 1, number * 2] for number in numbers])
    numbers = list(set(next_numbers))

    count += 1

result = str(count)

# print("Good Luck!")
print(result)
