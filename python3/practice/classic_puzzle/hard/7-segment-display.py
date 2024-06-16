# import sys
# import math

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
c = input()
s = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


def get_segment_char(num, pos, c):
    segments = [
        ['t', 'tl', 'tr', 'bl', 'br', 'b'],
        ['tr', 'br'],
        ['t', 'tr', 'c', 'bl', 'b'],
        ['t', 'tr', 'c', 'br', 'b'],
        ['tl', 'tr', 'c', 'br'],
        ['t', 'tl', 'c', 'br', 'b'],
        ['t', 'tl', 'c', 'bl', 'br', 'b'],
        ['t', 'tr', 'br'],
        ['t', 'tl', 'tr', 'c', 'bl', 'br', 'b'],
        ['t', 'tl', 'tr', 'c', 'br', 'b'],
    ]

    return c if pos in segments[num] else ' '


results = []
for digit in map(int, str(n)):
    tl_parts = get_segment_char(digit, 'tl', c) * s
    bl_parts = get_segment_char(digit, 'bl', c) * s
    results.append(f' {tl_parts} {bl_parts} ')

    t_parts = get_segment_char(digit, 't', c)
    c_parts = get_segment_char(digit, 'c', c)
    b_parts = get_segment_char(digit, 'b', c)
    tcb = (' ' * s).join([t_parts, c_parts, b_parts])
    results.extend([tcb] * s)

    tr_parts = get_segment_char(digit, 'tr', c) * s
    br_parts = get_segment_char(digit, 'br', c) * s
    results.append(f' {tr_parts} {br_parts} ')

    results.append(' ' * (s * 2 + 3))

results = pd.DataFrame(map(list, results)).T.to_numpy()
results = [''.join(result).rstrip() for result in results]

# print("answer")
for result in results:
    print(result)
