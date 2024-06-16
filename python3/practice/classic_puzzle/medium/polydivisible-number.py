# import sys
# import math

import numpy as np

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.


def is_polydivisible(number):
    str_number = str(number)

    return all(int(str_number[:i]) % i == 0 for i in range(1, len(str_number) + 1))


number = input()
numbers = list(map(int, number.split(' ')))

results = []

nbanswer = 36
for i in range(nbanswer):

    # Write an answer using print
    # To debug: print("Debug messages...", file=sys.stderr, flush=True)

    if i <= max(numbers):
        continue

    base_number = ''.join(np.base_repr(n, i) for n in numbers)

    if is_polydivisible(int(base_number, i)):
        results.append(i)

# print("value")
for result in results:
    print(result)
