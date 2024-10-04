# import sys
# import math

import numpy as np

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

m = int(input())
rs = []
for _ in range(m):
    r = input()
    rs.append(r)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

def calc_number_of_address(suffix):
    host_address_size = 32 - suffix

    return 2**host_address_size

results = []
for r in rs:
    prefix, suffix = r.split('/')
    suffix = int(suffix)

    bits = ''.join([np.base_repr(int(b), 2).rjust(8, '0') for b in prefix.split('.')])
    last_one_bit_index = bits.rfind('1')
    if last_one_bit_index < suffix:
        number_of_address = calc_number_of_address(suffix)

        results.append(f'valid {number_of_address}')

    else:
        new_suffix = last_one_bit_index + 1
        number_of_address = calc_number_of_address(new_suffix)

        results.append(f'invalid {prefix}/{new_suffix} {number_of_address}')

# print("answer")
for result in results:
    print(result)
