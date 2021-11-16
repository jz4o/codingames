import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

order = input()
side = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

layers = {'R': 1, 'L': 1, 'U': 1, 'D': 1}
across_groups = [['R', 'L'], ['U', 'D']]

for o in order:
    for across_group in across_groups:
        if o in across_group:
            layers[next(filter(lambda ag: o not in ag, across_group))] += layers[o]
        else:
            for s in across_group:
                layers[s] *= 2

    layers[o] = 1

# print("1")
print(layers[side])
