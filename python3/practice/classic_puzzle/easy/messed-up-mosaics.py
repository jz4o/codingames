# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
pattern = input()
rows = []
for _ in range(n):
    row = input()
    rows.append(row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

pattern_size = len(pattern)
n_size_pattern = pattern * n
double_size_pattern = pattern * 2

result = None
for row_index, row in enumerate(rows):
    if row in n_size_pattern:
        continue

    column_index = [i for i in range(n) if row[i:i + pattern_size] not in double_size_pattern][-1]

    result = f'({column_index},{row_index})'
    break

# print("(x,y)")
print(result)
