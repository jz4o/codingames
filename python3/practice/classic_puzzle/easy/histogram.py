# import sys
# import math

import itertools
import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

s = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

ALPHABETS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

letters = re.sub(f'[^{ALPHABETS}]', '', s.upper())

DECIMALS_DIGITS = 2

alphabet_rows = []
for alphabet in ALPHABETS:
    count = letters.count(alphabet)
    percentage = count / len(letters) * 100
    formatted_percentage = f'{percentage:.{DECIMALS_DIGITS}f}'

    space = ' ' * round(percentage)

    alphabet_row = f'{alphabet} |{space}|{formatted_percentage}%'.replace('||', '|')

    alphabet_rows.append(alphabet_row)

first_pipe_index = 2
bar_rows = []
for index in range(len(ALPHABETS) + 1):
    above_last_pipe_index = alphabet_rows[index- 1].rindex('|') if index > 0 else first_pipe_index
    below_last_pipe_index = alphabet_rows[index].rindex('|') if index < len(ALPHABETS) else first_pipe_index

    last_pipe_index = max(above_last_pipe_index, below_last_pipe_index)

    row = ' ' * (last_pipe_index + 1)

    row = f'{row[:first_pipe_index]}{"-" * (last_pipe_index - first_pipe_index)}{row[last_pipe_index:]}'

    row = f'{row[:first_pipe_index]}+{row[first_pipe_index + 1:]}'
    row = f'{row[:above_last_pipe_index]}+{row[above_last_pipe_index + 1:]}'
    row = f'{row[:below_last_pipe_index]}+{row[below_last_pipe_index + 1:]}'

    bar_rows.append(row)

results = [
    result
    for result
    in itertools.chain.from_iterable(itertools.zip_longest(bar_rows, alphabet_rows))
    if result is not None
]

# print("answer")
for result in results:
    print(result)
