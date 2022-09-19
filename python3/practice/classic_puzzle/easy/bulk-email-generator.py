# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
lines = []
for i in range(n):
    line = input()
    lines.append(line)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

joined_lines = '\n'.join(lines)

choice_count = 0
for choice_text in re.findall(r'(\((.|\s)*?\))', joined_lines):
    choice_text = choice_text[0]

    choices = choice_text[1:-1].split('|')
    choiced = choices[choice_count % len(choices)]

    choice_count += 1

    joined_lines = joined_lines.replace(choice_text, choiced, 1)

results = joined_lines.split('\n')

# print("42")
for result in results:
    print(result)
