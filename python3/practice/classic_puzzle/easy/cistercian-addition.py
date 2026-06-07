# import sys
# import math

from dataclasses import dataclass

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

num1_lines = []
for _ in range(5):
    num1_line = input()
    num1_lines.append(num1_line)
num2_lines = []
for _ in range(5):
    num2_line = input()
    num2_lines.append(num2_line)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class CistercianNumeral:
    @dataclass
    class Map:
        row: int
        column: int

    PLACE_CHAR_MAP = {
        'ones': {
            'chars': ['   ', '_  ', ' _ ', ' \\ ', ' / ', '_/ ', '  |', '_ |', ' _|', '__|'],
            'maps': [Map(0, 3), Map(1, 3), Map(1, 4)],
        },
        'tens': {
            'chars': ['   ', '_  ', '  _', '  /', '  \\', '_ \\', ' | ', '_| ', ' |_', '_|_'],
            'maps': [Map(0, 1), Map(1, 0), Map(1, 1)],
        },
        'hundreds': {
            'chars': ['    ', ' _  ', '_   ', ' /  ', ' \\  ', ' \\ ‾', '  | ', ' _| ', '_ | ', '__| '],
            'maps': [Map(2, 3), Map(3, 3), Map(3, 4), Map(4, 3)],
        },
        'thousands': {
            'chars': ['    ', '  _ ', '_   ', '  \\ ', '  / ', '  /‾', ' |  ', ' |_ ', '_|  ', '_|_ '],
            'maps': [Map(2, 1), Map(3, 0), Map(3, 1), Map(4, 1)],
        },
    }

    @classmethod
    def to_arabic(cls, cistercian_lines):
        grid = [list(line) for line in cistercian_lines]

        place_nums = []
        for place_key in ['thousands', 'hundreds', 'tens', 'ones']:
            char_map = cls.PLACE_CHAR_MAP[place_key]
            char = ''.join(grid[m.row][m.column] for m in char_map['maps'])
            place_num = char_map['chars'].index(char)

            place_nums.append(str(place_num))

        return int(''.join(place_nums))

    @classmethod
    def from_arabic(cls, num):
        grid = [
            list(row)
            for row
            in [
                '     ',
                '  |  ',
                '  |  ',
                '  |  ',
                '     ',
            ]
        ]

        str_num = str(num)
        place_nums = {
            'ones': int(str_num[-1]) if len(str_num) >= 1 else 0,
            'tens': int(str_num[-2]) if len(str_num) >= 2 else 0,
            'hundreds': int(str_num[-3]) if len(str_num) >= 3 else 0,
            'thousands': int(str_num[-4]) if len(str_num) >= 4 else 0,
        }

        for place_key, place_num in place_nums.items():
            char_map = cls.PLACE_CHAR_MAP[place_key]

            place_char = char_map['chars'][place_num]
            for index, char in enumerate(place_char):
                m = char_map['maps'][index]
                grid[m.row][m.column] = char

        return [''.join(row) for row in grid]

num1 = CistercianNumeral.to_arabic(num1_lines)
num2 = CistercianNumeral.to_arabic(num2_lines)

addition = num1 + num2

results = CistercianNumeral.from_arabic(addition)

# print("result")
for result in results:
    print(result)
