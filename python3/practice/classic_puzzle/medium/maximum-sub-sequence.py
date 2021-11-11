import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
ls = []
for i in input().split():
    l = int(i)

    ls.append(l)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

sequences = []
for l in ls:
    for sequence in sequences:
        if sequence[-1] + 1 == l:
            sequence.append(l)

    sequences.append([l])

max_size = max(map(len, sequences))
result_sequence = next(filter(lambda sequence: len(sequence) == max_size, reversed(sequences)))
result = ' '.join(map(str, result_sequence))

# print("1 2 3 4 5")
print(result)
