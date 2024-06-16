# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

expression = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

BRACKETS = {
    '(': ')',
    '[': ']',
    '{': '}',
}

expression = ''.join(re.findall('[()\\[\\]{}]', expression))

collect_flag = True
chars = []
for char in expression:
    if char in BRACKETS:
        chars.append(char)
        continue
    if len(chars) > 0 and chars[-1] in BRACKETS and BRACKETS[chars.pop()] == char:
        continue

    collect_flag = False
    break

if len(chars) > 0:
    collect_flag = False

# print("true/false")
print(str(collect_flag).lower())
