# import sys
# import math

import numpy as np

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

number = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

converter = {
    'from': '0123456789abcdef',
    'to_v': '0153#2e#8a9#c#6#',
    'to_h': '015##2a#8e6d#b9#',
    'to_vh': '012##59#86e###a#'
}

binary = np.base_repr(int(number, 16), 2)

is_v_reverse = binary.count('1') % 2 == 1
is_h_reverse = binary.count('0') % 2 == 1

if is_v_reverse and is_h_reverse:
    convert_to = 'to_vh'
elif is_v_reverse:
    convert_to = 'to_v'
elif is_h_reverse:
    convert_to = 'to_h'
else:
    convert_to = 'from'

translation = number.maketrans(converter['from'], converter[convert_to])
result = number.translate(translation)

if is_h_reverse:
    result = result[::-1]

if '#' in result:
    result = 'Not a number'

result = result[:1000]

# print("hexflipped_number")
print(result)
