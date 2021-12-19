import sys
import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
cgs_contents = []
for i in range(n):
    cgscontent = input()

    cgs_contents.append(cgscontent)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

variables = {}
characters = []
replace_char = 'a'

replaced_cgs_contents = []
for cgs_content in cgs_contents:
    # replace variable part
    for matched_variable in re.findall('\\$.+?\\$', cgs_content):
        if matched_variable not in variables:
            variables[matched_variable] = replace_char
            replace_char = chr(ord(replace_char) + 1)

        cgs_content = cgs_content.replace(matched_variable, f'${variables[matched_variable]}$')

    # replace character part
    for matched_character in re.findall("'.+?'", cgs_content):
        cgs_content = cgs_content.replace(matched_character, f'${len(characters)}$')
        characters.append(matched_character)

    cgs_content = cgs_content.replace(' ', '')
    replaced_cgs_contents.append(cgs_content)

# restore character part
result = ''.join(replaced_cgs_contents)
for index, character in enumerate(characters):
    result = result.replace(f'${index}$', character)

# print("minified all CGS content")
print(result)
