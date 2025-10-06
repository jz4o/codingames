# import sys
# import math

import numpy as np

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

username = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

core_seed = (sum(ord(c) for c in username) * len(username)) ^ 20480

segment_1 = core_seed & 65535
segment_2 = core_seed >> 16
segment_3 = sum(ord(c) for c in [username[0], username[-1]]) * len(username)
segment_4 = sum([segment_1, segment_2, segment_3]) % 65536

serial_segments = [
    np.base_repr(segment, 16).rjust(4, '0')
    for segment
    in [segment_1, segment_2, segment_3, segment_4]
]

result = '-'.join(serial_segments).upper()

# print("Serial Key")
print(result)
