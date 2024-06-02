# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
input_lines = []
for _ in range(n):
    lines = input()
    input_lines.append(lines)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

correspond_dict = {}

for line in input_lines:
    words = line.split(', ')
    for word in words:
        other_words = set(words) - {word}
        regexp_word = '.*?'.join(list(word))

        kangaroos = [other_word for other_word in other_words if re.search(regexp_word, other_word) is not None]
        for kangaroo in kangaroos:
            if kangaroo not in correspond_dict:
                correspond_dict[kangaroo] = []
            correspond_dict[kangaroo].append(word)

results = []
if len(correspond_dict) == 0:
    results.append('NONE')
else:
    for key in sorted(correspond_dict.keys()):
        values = correspond_dict[key]
        results.append(f'{key}: {", ".join(values)}')

# print("answer")
for result in results:
    print(result)
