# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

b = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

chunked_bits = []
for char in b:
    if len(chunked_bits) == 0 or chunked_bits[-1]['type'] != char:
        chunked_bits.append({'type': char, 'size': 1})
    else:
        chunked_bits[-1]['size'] += 1

sequences = []
if len(chunked_bits) == 1:
    # all bits is equal

    chunked_bit = chunked_bits[0]
    sequences.append(chunked_bit['size'] - 1 if chunked_bit['type'] == '1' else 1)
else:
    # extend a positive
    sequences.extend([chunk['size'] + 1 for chunk in chunked_bits if chunk['type'] == '1'])

    # connect two positive
    for i in range(len(chunked_bits) - 2):
        previous_chunk, current_chunk, next_chunk = chunked_bits[i:i + 3]

        if current_chunk['type'] != '0':
            continue

        if current_chunk['size'] != 1:
            continue

        sequences.append(previous_chunk['size'] + current_chunk['size'] + next_chunk['size'])

result = max(sequences)

# print("answer")
print(result)
