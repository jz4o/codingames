# import sys
# import math

import pandas as pd
import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
x = int(input())
char_grid = []
for i in range(n):
    line = input()
    char_grid.append(list(line))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

# array to strign
char_grid = pd.DataFrame(char_grid).T
chars = ''
for index, row in enumerate(char_grid.values):
    chars += ''.join(reversed(row) if index % 2 == 0 else row)

# rotate char(s)
start_index = (n**2) - x
chars = (chars * 2)[start_index:start_index + len(chars)]

# string to array
char_grid = [list(reversed(row) if index % 2 == 0 else row) for index, row in enumerate(re.findall(f'.{{{n}}}', chars))]
char_grid = pd.DataFrame(char_grid).T

results = [''.join(row) for row in char_grid.values]

# print("answer")
for result in results:
    print(result)
