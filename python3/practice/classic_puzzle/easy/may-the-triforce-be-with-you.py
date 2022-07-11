# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

width = n * 4 - 1

upper_part = ''
lower_part = ''
for i in range(1, n + 1):
    part = '*' * (i * 2 - 1)

    upper_left_space_part = ' ' * int((width - len(part)) / 2)
    upper_part += upper_left_space_part + part + "\n"

    lower_space_part = ' ' * ((n - i + 1) * 2 - 1)
    lower_line = part + lower_space_part + part
    lower_left_space_part = ' ' * int((width - len(lower_line)) / 2)
    lower_part += lower_left_space_part + lower_line + "\n"

upper_part = re.sub('^.', '.', upper_part)
result = upper_part + lower_part.rstrip()

# print("answer")
print(result)
