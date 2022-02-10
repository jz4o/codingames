import sys
import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
isbns = []
for i in range(n):
    isbn = input()

    isbns.append(isbn)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

MODULUS_WEIGHTS = {
    '10': [1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3],
    '11': list(reversed(range(1, 10 + 1)))
}

invalids = []
for isbn in isbns:
    if not re.fullmatch('\\d+X?', isbn):
        invalids.append(isbn)
        continue

    modulus = None
    if len(isbn) == 10:
        modulus = 11
    elif len(isbn) == 13:
        if isbn[-1] == 'X':
            invalids.append(isbn)
            continue
        modulus = 10
    else:
        invalids.append(isbn)
        continue

    sum_value = sum([int(digit) * MODULUS_WEIGHTS[str(modulus)][index] for index, digit in enumerate(isbn[:-1])])
    check_sum = (modulus - (sum_value % modulus)) % modulus
    if check_sum != '0123456789X'.index(isbn[-1]):
        invalids.append(isbn)

results = []
results.append(f'{len(invalids)} invalid:')
results.extend(invalids)

# print("answer")
for result in results:
    print(result)
