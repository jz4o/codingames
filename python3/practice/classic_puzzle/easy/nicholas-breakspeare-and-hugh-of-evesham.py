# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
numbers = []
for i in range(n):
    x = input()

    numbers.append(x)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


def how_to_read(number):
    if number[0] == '-':
        return f'negative {how_to_read(number[1:])}'

    if len(number) >= 4:
        over_thousand_unit_names = ['', 'thousand', 'million', 'billion', 'trillion', 'quadrillion', 'quintillion']

        number_size = len(number)
        unit_number_size = number_size % 3
        if unit_number_size == 0:
            unit_number_size = 3
        mod_number_size = number_size - unit_number_size

        unit_number = number[:unit_number_size]
        mod_number = number[unit_number_size:]

        result = ''
        result += f'{how_to_read(unit_number)} {over_thousand_unit_names[mod_number_size // 3]}'
        if not re.fullmatch('^0+$', mod_number):
            result += f' {how_to_read(mod_number)}'

        return result

    result = ''
    number = int(number)
    if 100 <= number:
        hundred_unit, mod_unit = divmod(number, 100)

        if hundred_unit != 0:
            result += f'{how_to_read(str(hundred_unit))} hundred'
        if mod_unit != 0:
            result += f' {how_to_read(str(mod_unit))}'
    elif 20 <= number < 100:
        ten_unit_names = ['', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']
        ten_unit, mod_unit = divmod(number, 10)

        if ten_unit != 0:
            result += ten_unit_names[ten_unit]
        if mod_unit != 0:
            result += f'-{how_to_read(str(mod_unit))}'
    else:
        under_twenty_names = [
            'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten',
            'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'
        ]

        result = under_twenty_names[number]

    return result.strip()


results = map(how_to_read, numbers)

# print("cardinal")
for result in results:
    print(result)
