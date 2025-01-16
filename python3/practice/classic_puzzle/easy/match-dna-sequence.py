# import sys
# import math

import itertools

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

delta = int(input())
gene = input()
n = int(input())
chrs = []
for _ in range(n):
    _chr = input()
    chrs.append(_chr)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

matches = []
for chr_index, chr_string in enumerate(chrs):
    for start_index in range(len(chr_string) - len(gene) + delta + 1):
        chr_chars = chr_string[start_index:start_index + len(gene)]
        diff_count = [g != c for g, c in itertools.zip_longest(gene, chr_chars)].count(True)

        if diff_count <= delta:
            matches.append(f'{chr_index} {start_index} {diff_count}')

result = next(iter(matches), 'NONE')

# print("line index delta")
print(result)
