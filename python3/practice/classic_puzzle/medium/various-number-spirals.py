# import sys
# import math

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
vert_pos, hor_pos = input().split()
order, direction = input().split()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class NumberSpiral:
    @classmethod
    def create(cls, size, vert_pos, hor_pos, order, direction):
        number_spiral = cls.__create_fixed_number_spiral(size)

        # starting point
        for _ in range(['br', 'tr', 'tl', 'bl'].index(f'{vert_pos}{hor_pos}')):
            number_spiral = cls.__counter_clock(number_spiral)

        # direction
        if direction == 'cc':
            number_spiral = cls.__reverse_direction(number_spiral)

        # order
        if order == '+':
            number_spiral = cls.__reverse_order(number_spiral)

        return number_spiral

    # create spiral by below condition
    #
    # conditions:
    #
    #   size: #{size}
    #   vert_pos: b
    #   hor_pos: r
    #   order: -
    #   direction: c
    #
    # exapmles:
    #
    #   5 4 3
    #   6 1 2
    #   7 8 9
    #
    #   10  9  8  7
    #   11  2  1  6
    #   12  3  4  5
    #   13 14 15 16
    @classmethod
    def __create_fixed_number_spiral(cls, size):
        top_rows = []
        bottom_rows = []

        for i in range(1, size // 2 * 2 + 2, 2):
            top_row_right_value = i**2 + i + 2
            top_row_left_value = top_row_right_value + i - 1
            top_row = list(reversed(range(top_row_right_value, top_row_left_value + 1)))

            bottom_row_right_value = i**2
            bottom_row_left_value = bottom_row_right_value - i + 1
            bottom_row = list(range(bottom_row_left_value, bottom_row_right_value + 1))

            for j in range(1, (((size // 2 * 2 + 1) - i) // 2) + 1):
                inner_square_last_value = (i + (j - 1) * 2)**2
                outer_square_last_value = (i + (j * 2))**2

                bottom_row_left_value = outer_square_last_value - i - j * 3 + 1
                bottom_row_right_value = inner_square_last_value + j

                top_row_left_value = bottom_row_left_value - i
                top_row_right_value = bottom_row_right_value + i

                top_row.append(top_row_right_value)
                top_row.insert(0, top_row_left_value)

                bottom_row.append(bottom_row_right_value)
                bottom_row.insert(0, bottom_row_left_value)

            top_rows.insert(0, top_row)
            bottom_rows.append(bottom_row)

        # remove trash row
        top_rows.pop(0)

        number_spiral = top_rows + bottom_rows

        if size % 2 == 0:
            number_spiral.pop()
            number_spiral = [number_row[1:] for number_row in number_spiral]
            for _ in range(2):
                number_spiral = cls.__counter_clock(number_spiral)

        return number_spiral

    @classmethod
    def __counter_clock(cls, number_spiral):
        return pd.DataFrame(number_spiral).T.iloc[::-1].values.tolist()

    @classmethod
    def __reverse_order(cls, number_spiral):
        spiral_size = len(number_spiral)

        numbers = sum(number_spiral, [])
        sum_number = min(numbers) + max(numbers)

        numbers = [sum_number - number for number in numbers]

        return [numbers[i * spiral_size:(i + 1) * spiral_size] for i in range(spiral_size)]

    @classmethod
    def __reverse_direction(cls, number_spiral):
        numbers = sum(number_spiral, [])
        is_start_tl_or_br = max(numbers) in [numbers[0], numbers[-1]]

        if is_start_tl_or_br:
            return pd.DataFrame(number_spiral).T.values.tolist()
        else:
            return pd.DataFrame(number_spiral).iloc[::-1].T.iloc[::-1].values.tolist()


number_spiral = NumberSpiral.create(n, vert_pos, hor_pos, order, direction)

results = ['\t'.join(map(str, row)) for row in number_spiral]

# print("spiral")
for result in results:
    print(result)
