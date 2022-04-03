import sys
import math

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

BINGO_ROWS = 5

n = int(input())
rows = []
for i in range(n * BINGO_ROWS):
    row = input()
    rows.append(row)
calls = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

player_numbers = []
lines = []

for i in range(0, len(rows), BINGO_ROWS):
    player_rows = rows[i:i+BINGO_ROWS]

    grid = pd.DataFrame([map(int, row.split()) for row in player_rows])

    player_numbers.append(set(grid.values.ravel()))

    lines.extend(map(set, grid.values))
    lines.extend(map(set, grid.T.values))

    lines.append(set([grid.iloc[i, i] for i in range(0, BINGO_ROWS)]))
    lines.append(set([grid.iloc[i, BINGO_ROWS - i - 1] for i in range(0, BINGO_ROWS)]))

for numbers in player_numbers:
    numbers -= set([0])
for line in lines:
    line -= set([0])

call_numbers = map(int, calls.split())

complete_index = None
full_house_index = None
for index, number in enumerate(call_numbers, start=1):
    for line in lines:
        line -= set([number])
    if complete_index is None and any([len(line) == 0 for line in lines]):
        complete_index = index

    for numbers in player_numbers:
        numbers -= set([number])
    if full_house_index is None and any([len(numbers) == 0 for numbers in player_numbers]):
        full_house_index = index
        break

# print("answer")
print(complete_index)
print(full_house_index)
