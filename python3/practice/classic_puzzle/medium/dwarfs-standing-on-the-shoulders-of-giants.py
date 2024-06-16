# import sys
# import math

import itertools

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())  # the number of relationships of influence
relations = {}
for _ in range(n):
    # x: a relationship of influence between two people (x influences y)
    x, y = (int(j) for j in input().split())

    if x not in relations:
        relations[x] = []

    relations[x].append(y)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

targets = relations.keys()
deep_level = 0
while len(targets) > 0:
    deep_level += 1

    targets = list(itertools.chain.from_iterable([relations[target] for target in targets if target in relations]))

# The number of people involved in the longest succession of influences
# print("2")
print(deep_level)
