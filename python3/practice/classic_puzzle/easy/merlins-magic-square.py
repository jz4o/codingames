# import sys
# import math

from functools import reduce

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

row_1 = input()
row_2 = input()
row_3 = input()
all_buttons_pressed = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

FULL_BIT = int('111111111', 2)
REVERSE_CENTER_BIT = int('000010000', 2)
REVERSE_BIT_STRINGS = [
    '000000000',
    '110110000',
    '111000000',
    '011011000',
    '100100100',
    '010111010',
    '001001001',
    '000110110',
    '000000111',
    '000011011',
]
REVERSE_BITS = [int(reverse_bit, 2) for reverse_bit in REVERSE_BIT_STRINGS]

translate_table = str.maketrans({
    '~': '0',
    '*': '1',
    ' ': '',
})
before_button_bit_string = f'{row_1}{row_2}{row_3}'.translate(translate_table)
before_button_bit = int(before_button_bit_string, 2)
after_button_bit = reduce(
    lambda button_bit, button: button_bit ^ REVERSE_BITS[int(button)],
    all_buttons_pressed,
    before_button_bit,
)

result = REVERSE_BITS.index((FULL_BIT - after_button_bit) ^ REVERSE_CENTER_BIT)

# print("answer (a single digit)")
print(result)
