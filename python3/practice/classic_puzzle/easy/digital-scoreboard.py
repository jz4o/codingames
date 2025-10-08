# import sys
import math

import numpy as np
import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

rows = []
for _ in range(23):
    row = input()
    rows.append(row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class DigitalNumber:
    def __init__(self, score_rows):
        self.bits_list = self._to_bits_list(score_rows)

    def subtract_score(self, score_rows):
        subtracted_bits_list = []
        for s1, s2 in zip(self.bits_list, self._to_bits_list(score_rows), strict=True):
            subtracted_bits_list.append(s1 & (s2 ^ int('1111111', 2)))

        self.bits_list = subtracted_bits_list

    def add_score(self, score_rows):
        self.bits_list = [s1 | s2 for s1, s2 in zip(self.bits_list, self._to_bits_list(score_rows), strict=True)]

    def __str__(self):
        digit_bits = [
            '1110111', '0000011', '0111110', '0011111', '1001011',
            '1011101', '1111101', '0010011', '1111111', '1011111',
        ]

        return ''.join([str(digit_bits.index(np.base_repr(s, 2).rjust(7, '0'))) for s in reversed(self.bits_list)])

    def _to_bits_list(self, score_rows):
        row_size = 8

        score_grid = pd.DataFrame(map(list, score_rows)).T
        bits_list = []
        for i in range(math.ceil(len(score_grid) / 8)):
            digit_rows = score_grid[i * row_size:(i + 1) * row_size]
            if len(digit_rows) != row_size:
                continue

            bits = ''.join([
                '1' if digit_rows.iloc[2, 2] == '|' else '0',  # left top
                '1' if digit_rows.iloc[2, 4] == '|' else '0',  # left bottom
                '1' if digit_rows.iloc[4, 1] == '~' else '0',  # center top
                '1' if digit_rows.iloc[4, 3] == '~' else '0',  # center
                '1' if digit_rows.iloc[4, 5] == '~' else '0',  # center bottom
                '1' if digit_rows.iloc[6, 2] == '|' else '0',  # right top
                '1' if digit_rows.iloc[6, 4] == '|' else '0',  # right bottom
            ])

            bits_list.append(int(bits, 2))

        bits_list.reverse()

        return bits_list


ROW_SIZE = 8
digital_rows1, digital_rows2, digital_rows3 = (rows[i * ROW_SIZE:(i + 1) * ROW_SIZE] for i in range(3))

digital_number = DigitalNumber(digital_rows1)
digital_number.subtract_score(digital_rows2)
digital_number.add_score(digital_rows3)

result = str(digital_number)

# print("newScore")
print(result)
