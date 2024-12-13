# import sys
# import math

import numpy as np

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

mask = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

matching_values = [
    2**index
    for index, i
    in enumerate(reversed(np.base_repr(int(mask, 16), 2)))
    if i == '1'
]

smallest_results = []
for n in range(1, 16):
    n_digits = [int(i) for i in np.base_repr(n, 2)]
    if len(n_digits) > len(matching_values):
        continue

    smallest_results.append(sum(
        i * matching_values[index]
        for index, i
        in enumerate(reversed(n_digits))
    ))

largest_results = [
    s
    for s
    in [sum(matching_values[1:]), sum(matching_values)]
    if s > 0
]

results = (
    smallest_results
    if largest_results[-1] in smallest_results
    else [*smallest_results[:13], '...', *largest_results]
)

result = ','.join(str(r) for r in results)

# print("Good Luck!")
print(result)
