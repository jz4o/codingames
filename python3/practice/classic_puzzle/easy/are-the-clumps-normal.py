import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

digits = list(map(int, n))
max_digit = max(digits)
chunk_size = 1
base = 1

while True:
    base += 1

    temp_chunk = []
    for digit in digits:
        mod = digit % base
        if len(temp_chunk) == 0 or temp_chunk[-1][0] != mod:
            temp_chunk.append([mod, [digit]])

    temp_chunk_size = len(temp_chunk)
    if temp_chunk_size < chunk_size or max_digit < base:
        break

    chunk_size = temp_chunk_size

result = 'Normal' if max_digit < base else base

# print("Normal")
print(result)
