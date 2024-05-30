# import sys
# import math

import numpy as np
import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

_input = input()
# for i in range(4):
#
#     # Write an answer using print
#     # To debug: print("Debug messages...", file=sys.stderr, flush=True)
#
#     print("answer")

digits = [int(c) for c in _input.replace(':', '')[1:]]
four_bit_digits = [np.base_repr(d, 2).rjust(4, '0') for d in digits]
transposed_four_bit_digits = pd.DataFrame([list(bits) for bits in four_bit_digits]).T.values

results = []
for bits in transposed_four_bit_digits:
    replaced_bits = [('_' if b == '0' else '#') * 5 for b in bits]

    results.append(f'|{"|".join(replaced_bits)}|')

for result in results:
    print(result)
