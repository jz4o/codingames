# import sys
# import math

import re

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
swaps = []
for _ in range(n):
    swap = input()
    swaps.append(swap)
length = int(input())
encoded_message = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

def each_slice(target_list: list, n: int):
    return [target_list[i:i + n] for i in range(0, len(target_list), n)]

swap_dict = dict(swap.split(' -> ') for swap in swaps)

encoded_chars = list(encoded_message.replace('+', ''))
decode_chars = []
stack = []
while len(encoded_chars) > 0:
    char = encoded_chars.pop(0)

    if char == '*':
        stack_char = stack.pop()
        decode_chars.append(swap_dict.get(stack_char, stack_char))
    elif char == '#':
        pop_size = int(encoded_chars.pop(0))
        stack = stack[:-pop_size]
    elif char == '%':
        if len(stack) % 2 == 1:
            stack.append(None)
        stack = pd.DataFrame(each_slice(stack, 2)).T.to_numpy().ravel().tolist()
        if stack[-1] is None:
            stack.pop()
    else:
        stack.append(char)

decode_message = ''.join(decode_chars)

MAX_LENGTH = 75
matches = re.findall(rf'.{{,{MAX_LENGTH}}}\s', f'{decode_message} ')
results = [match.strip() for match in matches]

# print("decoded_message")
for result in results:
    print(result)
