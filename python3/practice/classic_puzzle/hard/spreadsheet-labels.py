# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
labels = []
for label in input().split():
    # pass
    labels.append(label)


def to_alpha_label(alpha):
    alphabets = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

    result = ''
    i = int(alpha)
    while i > 0:
        i, mod = divmod(i, len(alphabets))
        if mod == 0:
            i -= 1

        result = alphabets[mod - 1] + result

    return result


def to_int_label(alpha):
    alphabets = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

    result = 0
    for index, i in enumerate(reversed(alpha)):
        result += (len(alphabets)**index) * (alphabets.index(i) + 1)

    return str(result)


results = []
for label in labels:
    if re.fullmatch(r'^\d+$', label):
        results.append(to_alpha_label(label))
    else:
        results.append(to_int_label(label))

result = ' '.join(results)

# puts results.join(' ')
print(result)
