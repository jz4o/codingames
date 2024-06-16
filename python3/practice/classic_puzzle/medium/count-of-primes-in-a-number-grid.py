# import sys
# import math

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

r, c = (int(i) for i in input().split())
digit_grid = []
for _ in range(r):
    row = input()
    digit_grid.append(row.split(' '))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


def combination_digits(row):
    result = []
    for size in range(2, len(row) + 1):
        result.extend(int(''.join(row[index:index + size])) for index in range(len(row) - size + 1))

    return result


def is_prime(num):
    if num < 2:
        return False

    i = 2
    while i < num:
        if num % i == 0:
            return False

        i += 1

    return True


digits = []
for row in digit_grid:
    digits.extend([int(i) for i in row])
    digits.extend(combination_digits(row))
for row in pd.DataFrame(digit_grid).T.to_numpy():
    digits.extend(combination_digits(row))

result = len([digit for digit in set(digits) if is_prime(digit)])

# print("answer")
print(result)
