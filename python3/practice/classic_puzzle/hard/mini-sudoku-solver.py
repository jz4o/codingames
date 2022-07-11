# import sys
# import math

import itertools
import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

line_1 = input()
line_2 = input()
line_3 = input()
line_4 = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


def optimaze(square):
    for row_index, row in enumerate(square):
        for column_index, column in enumerate(row):
            if column != 0:
                continue

            candidate = [1, 2, 3, 4]
            candidate = list(set(candidate) - set(row))
            candidate = list(set(candidate) - set(pd.DataFrame(square).iloc[:, column_index]))

            candidate = list(set(candidate) - set(little_square_values(square, row_index, column_index)))

            if len(candidate) == 1:
                square[row_index][column_index] = candidate[0]


def little_square_values(square, row_index, column_index):
    little_square_rows = [0, 1] if row_index < len(square) / 2 else [2, 3]
    little_square_columns = [0, 1] if column_index < len(square[row_index]) / 2 else [2, 3]
    little_square_indexes = list(itertools.product(little_square_rows, little_square_columns))

    return list(map(lambda lsi: square[lsi[0]][lsi[1]], little_square_indexes))


lines = [line_1, line_2, line_3, line_4]
square = list(map(list, (lines)))
for line_index, line in enumerate(square):
    square[line_index] = list(map(int, line))

sum_value = sum(range(1, len(square) + 1)) * len(square)
while sum(map(sum, square)) != sum_value:
    optimaze(square)

results = []
for line in square:
    results.append(''.join(map(str, line)))

# print("answer")
for result in results:
    print(result)
