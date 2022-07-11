# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n, m = [int(i) for i in input().split()]
lines = []
for i in range(n):
    line = input()
    lines.append(line)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

string = ''.join(lines)

replaced_string = string
replace_list = []

replace_char = 'Z'

while True:
    chars = list(replaced_string)
    char_groups = [f'{l}{r}' for l, r in zip(chars[:-1], chars[1:])]
    group_sizes = [[char_group, len(re.findall(char_group, replaced_string))] for char_group in char_groups]

    max_group_size = max([group_size for _, group_size in group_sizes])
    target_char = None
    target_size = None
    for char_group, group_size in group_sizes:
        if group_size == max_group_size:
            target_char = char_group
            target_size = group_size
            break

    if target_size < 2:
        break

    replaced_string = replaced_string.replace(target_char, replace_char)
    replace_list.append(f'{replace_char} = {target_char}')

    replace_char = chr(ord(replace_char) - 1)

results = [replaced_string] + replace_list

# print("answer")
for result in results:
    print(result)
