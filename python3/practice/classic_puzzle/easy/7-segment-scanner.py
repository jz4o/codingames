# import sys
# import math

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

line_1 = input()
line_2 = input()
line_3 = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

DIGIT_NUMS = [
    ' ||_ _ ||',
    '       ||',
    '  |___ | ',
    '   ___ ||',
    ' |  _  ||',
    ' | ___  |',
    ' ||___  |',
    '   _   ||',
    ' ||___ ||',
    ' | ___ ||'
]

transposed_lines = pd.DataFrame([list(line_1), list(line_2), list(line_3)]).T

results = []
for index in range(0, len(transposed_lines), 3):
    num = DIGIT_NUMS.index(''.join(transposed_lines.values[index:index + 3].flatten()))
    results.append(num)

result = ''.join(map(str, results))

# print("number")
print(result)
