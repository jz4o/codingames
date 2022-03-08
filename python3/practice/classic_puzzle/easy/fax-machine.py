import sys
import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w = int(input())
h = int(input())
t = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

word_counts = list(map(int, t.split(' ')))
word = ''
for index, word_count in enumerate(word_counts):
    word += ('*' if index % 2 == 0 else ' ') * word_count

results = [f'|{row}|' for row in re.findall(f'.{{{w}}}', word)]

# print("|********|")
# print("|**      |")
# print("|    ****|")
for result in results:
    print(result)
