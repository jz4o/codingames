# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

count = int(input())
decimaries = input().split()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

def to_decimal(decimary):
    ace_indexes = [
        index
        for index, char
        in enumerate(reversed(decimary))
        if char == 'A'
    ]

    other_ace_decimal = int(decimary.replace('A', '0'))
    ace_decimal = sum(10**(index + 1) for index in ace_indexes)

    return other_ace_decimal + ace_decimal

def to_decimary(decimal):
    if decimal == 0 or '0' not in str(decimal):
        return decimal

    digits = [int(c) for c in str(decimal)]
    while 0 in digits[1:]:
        for index, digit in enumerate(digits[1:], start=1):
            if digit != 0:
                continue

            digits[index - 1] -= 1
            digits[index] = 10

    decimary = ''.join('A' if digit == 10 else str(digit) for digit in digits)

    return re.sub('^0+', '', decimary)

sum_decimal = sum(to_decimal(decimary) for decimary in decimaries)

result = to_decimary(sum_decimal)

# print("summation")
print(result)
