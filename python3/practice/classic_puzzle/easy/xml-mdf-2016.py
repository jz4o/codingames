# import sys
# import math

from fractions import Fraction

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

sequence = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

depths = {}
depth = 0
while len(sequence) > 0:
    char, sequence = sequence[0], sequence[1:]

    if char == '-':
        char, sequence = sequence[0], sequence[1:]

        if char not in depths:
            depths[char] = []

        depths[char].append(depth)

        depth -= 1
    else:
        depth += 1

for key, value in depths.items():
    depths[key] = sum([Fraction(1, v) for v in value])

max_value = max(depths.values())
result = [key for key, value in depths.items() if value == max_value][0]

# print("answer")
print(result)
