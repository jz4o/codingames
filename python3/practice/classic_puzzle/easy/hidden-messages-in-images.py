import sys
import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w, h = [int(i) for i in input().split()]
pixels = []
for i in range(h):
    for j in input().split():
        pixel = int(j)

        pixels.append(pixel)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

bits = ''.join([str(pixel % 2) for pixel in pixels])
result = ''.join([chr(int(bit, 2)) for bit in re.findall('.{8}', bits)])

# print("answer")
print(result)
