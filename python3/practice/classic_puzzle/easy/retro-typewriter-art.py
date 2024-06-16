# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

t = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

ABBREVIATIONS = {
    'sp': ' ',
    'bS': '\\',
    'sQ': "'",
    'nl': '\n',
}

t = t.replace('nl', '1nl')

chars = []
for chunk in t.split():
    count, char = re.findall(r'^(\d+)(.+?)$', chunk)[0]
    chars.append(ABBREVIATIONS.get(char, char) * int(count))

result = ''.join(chars)

# print("answer")
print(result)
