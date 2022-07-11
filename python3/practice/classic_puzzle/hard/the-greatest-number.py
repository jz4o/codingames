# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
_input = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

minus_flag = '-' in _input
dot_flag = '.' in _input
_input = _input.replace('-', '').replace('.', '').replace(' ', '')

if minus_flag:
    _input = ''.join(sorted(list(_input)))
    if dot_flag:
        _input = _input[0] + '.' + _input[1:]
    _input = '-' + _input
    if re.match(r'^-0\.0+$', _input):
        _input = '0'
else:
    _input = ''.join(sorted(list(_input), reverse=True))
    if dot_flag:
        _input = _input[:-1] + '.' + _input[-1]
    if _input.endswith('.0'):
        _input = _input[:-2]

# print("greatest")
print(_input)
