import sys
import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

s = input()


def is_encodable(text):
    encoded_text = encode(text)

    return encoded_text != None and encoded_text != text


def encode(text):
    if len(text) % 2 != 0:
        return None

    result = ''
    for i in range(0, len(text), 2):
        count = int(text[i])
        value = text[i + 1]
        result += value * count

    return result if is_decodable(result, text) else None


def is_decodable(encoded_text, original_text):
    result = ''
    while len(encoded_text) > 0:
        char = encoded_text[0]
        match_length = len(re.match(f"{char}+", encoded_text).group())

        encoded_text = encoded_text[match_length:]
        result += f'{match_length}{char}'

    return result == original_text


while True:
    if not is_encodable(s):
        break

    s = encode(s)

# puts @s
print(s)
