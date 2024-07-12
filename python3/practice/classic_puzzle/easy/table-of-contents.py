# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

lengthofline = int(input())
n = int(input())
entries = []
for _ in range(n):
    entry = input()
    entries.append(entry)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

INDENT = '    '

section_numbers = []
results = []
for entry in entries:
    content, page = entry.split(' ')

    indent_match = re.search(r'^>+', content)
    indent_str = indent_match.group() if indent_match else ''
    indent_level = len(indent_str)
    indent = INDENT * indent_level

    if len(section_numbers) <= indent_level:
        section_numbers.append(0)
    section_numbers[indent_level] += 1
    section_numbers = section_numbers[:indent_level + 1]
    section = f'{section_numbers[indent_level]} '

    title = content.replace(indent_str, '')

    dot_count = lengthofline - len(indent) - len(section) - len(title) - len(page)
    dots = '.' * dot_count

    results.append(f'{indent}{section}{title}{dots}{page}')

# print("Format error")
for result in results:
    print(result)
