import sys
import math

import collections
import itertools

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

parent_1, parent_2 = input().split()
ratio = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

product = itertools.product
from_iterable = itertools.chain.from_iterable

parent_1_elements = product(parent_1[:2], parent_1[-2:])
parent_2_elements = product(parent_2[:2], parent_2[-2:])

child = [''.join(sorted(from_iterable(combination))) for combination in product(parent_1_elements, parent_2_elements)]

child_counts = collections.Counter(child)

ratios = [child_counts[''.join(sorted(r))] for r in ratio.split(':')]

gcd = math.gcd(*ratios)

result = ':'.join(map(str, [r // gcd for r in ratios]))

# print("Genotypic Ratio")
print(result)
