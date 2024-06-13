# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

numbertext = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

is_carry_up = 0
is_significant_digit = False
digits = []
for d in numbertext:
    if re.match(r'\d|x', d) is None or (d == 'x' and is_carry_up == 0):
        digits.append(d)
        continue

    div, mod = divmod(is_carry_up + int(d if d != 'x' else 0), 2)

    is_carry_up = mod * 10
    is_significant_digit |= div > 0

    digits.append(str(div) if is_significant_digit else 'x')

result = ''.join(digits)

# print("answer")
print(result)
