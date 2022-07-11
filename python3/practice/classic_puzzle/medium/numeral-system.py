# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

equality = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

NUMERALS = list(map(str, range(10))) + [chr(i + ord('A')) for i in range(26)]

x, y, z = re.findall(r'(.+)\+(.+)=(.+)', equality)[0]

max_numeral = next(filter(lambda n: n in equality, reversed(NUMERALS)))
minimum_n = NUMERALS.index(max_numeral) + 1

result = next(filter(lambda i: int(x, i) + int(y, i) == int(z, i), range(minimum_n, len(NUMERALS) + 1)))

# print("answer")
print(result)
