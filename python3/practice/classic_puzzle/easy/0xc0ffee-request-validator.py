# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

frame_length = int(input())
frame = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

FRAME_HEADER = 'DECAFBAD'

order_regexp = fr'(.{{{len(FRAME_HEADER)}}})(.{{3}})(.+?)(.)$'
match_result = re.match(order_regexp, frame)
header, size, order, check_sum = match_result.groups() if match_result is not None else [''] * 4

is_valid_header = header == FRAME_HEADER
is_valid_size = size != '' and int(size, 16) == len(order)
is_valid_checksum = sum(int(c, 16) for c in frame) % 16 == 0
is_valid = is_valid_header and is_valid_size and is_valid_checksum

results = (
    [f'{order.count(o)} {o}' for o in list(dict.fromkeys(order))]
    if is_valid
    else ['403 Forbidden']
)

# print("0xC0FFEE")
for result in results:
    print(result)
