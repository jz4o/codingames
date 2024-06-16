# import sys
# import math

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

BINGO_ROWS = 5

n = int(input())
rows = []
for _ in range(n * BINGO_ROWS):
    row = input()
    rows.append(row)
calls = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

player_numbers = []
lines = []

for i in range(0, len(rows), BINGO_ROWS):
    player_rows = rows[i:i + BINGO_ROWS]

    grid = pd.DataFrame([map(int, row.split()) for row in player_rows])

    player_numbers.append(set(grid.to_numpy().ravel()))

    lines.extend(map(set, grid.values))
    lines.extend(map(set, grid.T.values))

    lines.append({grid.iloc[i, i] for i in range(BINGO_ROWS)})
    lines.append({grid.iloc[i, BINGO_ROWS - i - 1] for i in range(BINGO_ROWS)})

player_numbers = [numbers - {0} for numbers in player_numbers]
lines = [line - {0} for line in lines]

call_numbers = map(int, calls.split())

complete_index = None
full_house_index = None
for index, number in enumerate(call_numbers, start=1):
    lines = [line - {number} for line in lines]
    if complete_index is None and any(len(line) == 0 for line in lines):
        complete_index = index

    player_numbers = [numbers - {number} for numbers in player_numbers]
    if full_house_index is None and any(len(numbers) == 0 for numbers in player_numbers):
        full_house_index = index
        break

# print("answer")
print(complete_index)
print(full_house_index)
