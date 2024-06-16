# import sys
# import math

import itertools

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

s = input()
change_count = int(input())
raw_changes = []
for _ in range(change_count):
    raw_change = input()
    raw_changes.append(raw_change)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class Change:
    def __init__(self, row_index, column_index, string):
        self.row_index = row_index
        self.column_index = column_index
        self.string = string


temp_raw_changes = []
for raw_change in raw_changes:
    row_index, column_index, string = raw_change.split('|')
    row_index = int(row_index)
    column_index = int(column_index)

    temp_raw_changes.append(Change(row_index, column_index, string))
raw_changes = temp_raw_changes

raw_changes = sorted(raw_changes, key=lambda change: [-change.row_index, -change.column_index])

s_rows = s.split('\\n')
for raw_change in raw_changes:
    s_row = s_rows[raw_change.row_index]
    before = s_row[:raw_change.column_index]
    after = s_row[raw_change.column_index:]

    s_rows[raw_change.row_index] = before + raw_change.string + after

results = itertools.chain.from_iterable([s_row.split('\\n') for s_row in s_rows])

# print("answer")
for result in results:
    print(result)
