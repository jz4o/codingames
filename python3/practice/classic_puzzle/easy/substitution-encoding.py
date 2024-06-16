# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

rows = int(input())
grid = []
for _ in range(rows):
    row = input()
    grid.append(row.split(' '))
message = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

replace_table = {}
for row_index, row in enumerate(grid):
    for column_index, char in enumerate(row):
        replace_table[char] = f'{row_index}{column_index}'

result = ''.join([replace_table[char] for char in message])

# print("encode message")
print(result)
