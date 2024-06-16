# import sys

import math
import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
lines = []
for _ in range(n):
    line = input()

    lines.append(line)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


def gcd(numbers):
    result = max(numbers)
    for number in numbers:
        result = math.gcd(result, number)

    return result


number_indexes = [index for index, line in enumerate(lines) if re.fullmatch('^\\d+$', line)]
base_number = 1 if len(number_indexes) == 0 else int(lines[number_indexes[0]]) - number_indexes[0]

fizz_buzz_numbers = {'fizz': [], 'buzz': []}
for index, line in enumerate(lines):
    if 'Fizz' in line:
        fizz_buzz_numbers['fizz'].append(base_number + index)
    if 'Buzz' in line:
        fizz_buzz_numbers['buzz'].append(base_number + index)

fizz = gcd(fizz_buzz_numbers['fizz'])
buzz = gcd(fizz_buzz_numbers['buzz'])

result = f'{fizz} {buzz}'

# print("fizz buzz")
print(result)
