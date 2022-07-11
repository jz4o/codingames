# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

intext = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

result = intext

require_period = result.endswith('.')

result = result.replace(',', ', ')
result = re.sub('\\s+', ' ', result)

result = '. '.join([line.strip().capitalize() for line in result.split('.') if line != ''])

result = result.replace(' ,', ',')
result = re.sub(',+', ',', result)

if require_period:
    result += '.'

# print("solution")
print(result)
