# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

message_1 = input()
message_2 = input()
message_3 = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

message_1_binary_chars = [int(hexadecimal_char, 16) for hexadecimal_char in re.findall(r'.{2}', message_1)]
message_2_binary_chars = [int(hexadecimal_char, 16) for hexadecimal_char in re.findall(r'.{2}', message_2)]
message_3_binary_chars = [int(hexadecimal_char, 16) for hexadecimal_char in re.findall(r'.{2}', message_3)]

message_binary_chars = [
    nth_binary_char_1 ^ nth_binary_char_2 ^ nth_binary_char_3
    for nth_binary_char_1, nth_binary_char_2, nth_binary_char_3
    in zip(message_1_binary_chars, message_2_binary_chars, message_3_binary_chars, strict=True)
]

message_chars = [chr(message_binary_char) for message_binary_char in message_binary_chars]

result = ''.join(message_chars)

# print("clear message")
print(result)
