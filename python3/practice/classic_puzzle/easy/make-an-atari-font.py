# import sys
# import math

import itertools
import re

import numpy as np
import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

a_word = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

HEX_VALUES = {
    'A': 0x1818243C42420000,
    'B': 0x7844784444780000,
    'C': 0x3844808044380000,
    'D': 0x7844444444780000,
    'E': 0x7C407840407C0000,
    'F': 0x7C40784040400000,
    'G': 0x3844809C44380000,
    'H': 0x42427E4242420000,
    'I': 0x3E080808083E0000,
    'J': 0x1C04040444380000,
    'K': 0x4448507048440000,
    'L': 0x40404040407E0000,
    'M': 0x4163554941410000,
    'N': 0x4262524A46420000,
    'O': 0x1C222222221C0000,
    'P': 0x7844784040400000,
    'Q': 0x1C222222221C0200,
    'R': 0x7844785048440000,
    'S': 0x1C22100C221C0000,
    'T': 0x7F08080808080000,
    'U': 0x42424242423C0000,
    'V': 0x8142422424180000,
    'W': 0x4141495563410000,
    'X': 0x4224181824420000,
    'Y': 0x4122140808080000,
    'Z': 0x7E040810207E0000,
}

TRANSPOSED_ATARI_BIT_MAPS = {}
for key, value in HEX_VALUES.items():
    binary_value = np.base_repr(value, 2).rjust(64, '0')
    atari_value = binary_value.translate(str.maketrans({'0': ' ', '1': 'X'}))
    transposed_value = pd.DataFrame([list(row) for row in re.findall(r'.{8}', atari_value)]).T.to_numpy()

    TRANSPOSED_ATARI_BIT_MAPS[key] = transposed_value

transposed_result_map = itertools.chain.from_iterable([TRANSPOSED_ATARI_BIT_MAPS[char] for char in a_word])
result_rows = [''.join(row).rstrip() for row in pd.DataFrame(transposed_result_map).T.to_numpy()]

last_print_index = [index for index, row in enumerate(result_rows) if row.strip() != ''][-1]
results = result_rows[:last_print_index + 1]

# print("that word in Atari Font")
for result in results:
    print(result)
