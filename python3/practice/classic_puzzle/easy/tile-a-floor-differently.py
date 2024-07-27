# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

quarter_size = int(input())
rows = []
for _ in range(quarter_size):
    row = input()
    rows.append(row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class TileFloor:
    @classmethod
    def create(cls, pattern_parts):
        pattern_parts_size = len(pattern_parts)
        hyphen_size = pattern_parts_size * 2
        hyphen = '-' * hyphen_size
        border_row = f'+{hyphen}+{hyphen}+'

        pattern_rows = [
            f'|{pattern_row}|{pattern_row}|'
            for pattern_row
            in cls.reverse_vertical(cls.reverse_horizontal(pattern_parts))
        ]

        return [border_row, *pattern_rows, border_row, *pattern_rows, border_row]

    @staticmethod
    def reverse_horizontal(pattern_parts_rows):
        reverse_table = str.maketrans({
            'b': 'd',
            'd': 'b',
            'p': 'q',
            'q': 'p',
            '/': '\\',
            '\\': '/',
        })

        result_rows = []
        for pattern_parts_row in pattern_parts_rows:
            reverse_pattern_parts_row = ''.join(reversed(pattern_parts_row.translate(reverse_table)))

            result_row = f'{pattern_parts_row}{reverse_pattern_parts_row}'
            result_rows.append(result_row)

        return result_rows

    @staticmethod
    def reverse_vertical(pattern_parts_rows):
        reverse_table = str.maketrans({
            'b': 'p',
            'd': 'q',
            'p': 'b',
            'q': 'd',
            '/': '\\',
            '\\': '/',
        })

        reverse_pattern_parts_rows= [
            reverse_pattern_parts_row.translate(reverse_table)
            for reverse_pattern_parts_row
            in reversed(pattern_parts_rows)
        ]

        return [*pattern_parts_rows, *reverse_pattern_parts_rows]

results = TileFloor.create(rows)

# print("Tile Floor")
for result in results:
    print(result)
