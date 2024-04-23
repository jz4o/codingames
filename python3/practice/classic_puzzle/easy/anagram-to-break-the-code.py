# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w = input()
s = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

words = re.sub('[:.,?!]', ' ', s.lower()).split()
sorted_words = [''.join(sorted(word)) for word in words]

lower_case_w = w.lower()
sorted_w = ''.join(sorted(lower_case_w))

key_index = None
for index, (word, sorted_word) in enumerate(zip(words, sorted_words)):
    if word != lower_case_w and sorted_word == sorted_w:
        key_index = index
        break

results = []
if key_index is not None:
    results.extend([
        f'{key_index % 10}',
        f'{(len(sorted_words) - key_index - 1) % 10}',
        f'{sum([len(word) for word in sorted_words[:key_index]], 0) % 10}',
        f'{sum([len(word) for word in sorted_words[key_index + 1:]], 0) % 10}'
    ])
else:
    results.append('IMPOSSIBLE')

result = '.'.join(results)

# print("answer")
print(result)
