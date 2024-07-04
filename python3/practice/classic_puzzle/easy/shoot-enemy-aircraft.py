# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
lines = []
for _ in range(n):
    line = input()
    lines.append(line)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

ENEMY_VALUES = ['>', '<']
enemies = []
for row_index, row in enumerate(lines):
    for column_index, value in enumerate(row):
        if value not in ENEMY_VALUES:
            continue

        enemies.append((row_index, column_index, value))

LAUNCHER_VALUE = '^'
launcher_row_index = next(iter([index for index, row in enumerate(lines) if LAUNCHER_VALUE in row]))
launcher_column_index = lines[launcher_row_index].index(LAUNCHER_VALUE)

shoot_indexes = []
for (row_index, column_index, _value) in enemies:
    vertical_diff = launcher_row_index - row_index
    horizontal_diff = abs(launcher_column_index - column_index)

    shoot_indexes.append(abs(vertical_diff - horizontal_diff) - 1)

max_shoot_index = max(shoot_indexes)
results = ['SHOOT' if index in shoot_indexes else 'WAIT' for index in range(max_shoot_index + 1)]

# print("WAIT")
# print("SHOOT")
for result in results:
    print(result)
