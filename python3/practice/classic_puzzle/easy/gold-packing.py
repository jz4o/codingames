# import sys
# import math

import itertools

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

m = int(input())
n = int(input())
bars = []
for i in input().split():
    bar = int(i)
    bars.append(bar)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

combinations = []
for i in range(1, n + 1):
    combinations.extend([list(combination) for combination in itertools.combinations(bars, i)])

combinations = [combination for combination in combinations if sum(combination) <= m]
max_sum = max([sum(combination) for combination in combinations])
combinations = [combination for combination in combinations if sum(combination) == max_sum]

result = ' '.join(map(str, combinations[0]))

# print("7")
print(result)
