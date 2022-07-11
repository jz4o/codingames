# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

text = input()
_format = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

_format = _format.replace('\\', '\\\\')
for special_string in '^*()$':
    _format = _format.replace(special_string, f'\\{special_string}')

_format = _format.replace('?', '.')
_format = _format.replace('~', '.*')

result = 'MATCH' if re.match(_format, text) else 'FAIL'

# print("MATCH OR FAIL")
print(result)
