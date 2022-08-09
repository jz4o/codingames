# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

text_to_decode = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

words = text_to_decode.split(' ')

result = None
for _ in range(len(ALPHABET)):
    if 'CHIEF' in words:
        result = ' '.join(words)
        break

    temp_words = []
    for word in words:
        temp_chars = [ALPHABET[ALPHABET.index(char) - 1] for char in word]
        temp_words.append(''.join(temp_chars))
    words = temp_words

result = result or 'WRONG MESSAGE'

# print("DecodedText:string(101)")
print(result)
