# import sys
# import math

from fractions import Fraction
import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
lines = []
for i in range(n):
    line = input()

    lines.append(line)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class MimicryFraction:
    def __init__(self, numerator, denominator):
        self.numerator = numerator
        self.denominator = denominator


def fraction_to_directions(fraction):
    min_fraction = Fraction(0, 1)
    target_fraction = Fraction(1, 1)
    max_fraction = MimicryFraction(1, 0)

    result = ''
    while fraction != target_fraction:
        if fraction < target_fraction:
            max_fraction = target_fraction
            result += 'L'
        else:
            min_fraction = target_fraction
            result += 'R'

        numerator = min_fraction.numerator + max_fraction.numerator
        denominator = min_fraction.denominator + max_fraction.denominator
        target_fraction = Fraction(numerator, denominator)

    return result


def directions_to_fraction(directions):
    min_fraction = Fraction(0, 1)
    target_fraction = Fraction(1, 1)
    max_fraction = MimicryFraction(1, 0)

    for direction in directions:
        if direction == 'L':
            max_fraction = target_fraction
        else:
            min_fraction = target_fraction

        numerator = min_fraction.numerator + max_fraction.numerator
        denominator = min_fraction.denominator + max_fraction.denominator
        target_fraction = Fraction(numerator, denominator)

    return f'{target_fraction.numerator}/{target_fraction.denominator}'


results = []
for line in lines:
    if re.fullmatch('\\d+/\\d+', line):
        results.append(fraction_to_directions(Fraction(line)))
    else:
        results.append(directions_to_fraction(line))

# print("answer")
for result in results:
    print(result)
