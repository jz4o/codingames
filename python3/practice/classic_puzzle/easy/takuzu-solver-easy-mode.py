# import sys
# import math

import pandas as pd

# Takuzu Solver (Easy mode)
# No row or column may contain a sequence of three or more repeating digits
# e.g. 1 1 0 is valid but 1 1 1 is invalid

n = int(input())
rows = []
for _ in range(n):
    row = input()
    rows.append(row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

def transpose_rows(rows):
    grid = [list(row) for row in rows]

    return [
        ''.join(transposed_row)
        for transposed_row
        in pd.DataFrame(grid).T.to_numpy()
    ]

replace_dict = {
  '.00': '100',
  '0.0': '010',
  '00.': '001',
  '.11': '011',
  '1.1': '101',
  '11.': '110',
}

while any('.' in row for row in rows):
    for row_index, row in enumerate(rows):
        temp_row = row
        for from_value, to_value in replace_dict.items():
            temp_row = temp_row.replace(from_value, to_value)
        rows[row_index] = temp_row

    transposed_rows = transpose_rows(rows)
    for row_index, row in enumerate(transposed_rows):
        temp_row = row
        for from_value, to_value in replace_dict.items():
            temp_row = temp_row.replace(from_value, to_value)
        transposed_rows[row_index] = temp_row
    rows = transpose_rows(transposed_rows)

results = rows

# print("Completed board")
for result in results:
    print(result)
