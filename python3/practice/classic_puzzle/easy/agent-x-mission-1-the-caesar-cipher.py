# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

ciphertext = input()
word = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

MIN_ASCII_CODE = 32
MAX_ASCII_CODE = 126
ASCII_CODE_SIZE = MAX_ASCII_CODE - MIN_ASCII_CODE + 1

decrypted_key = None
decrypted_message = None
for key in range(ASCII_CODE_SIZE):
    decrypted_text = ''.join(
        chr(((ord(c) - MIN_ASCII_CODE - key) % ASCII_CODE_SIZE) + MIN_ASCII_CODE)
        for c
        in ciphertext
    )

    if word not in re.split(r'[\s,.?;:!]', decrypted_text):
        continue

    decrypted_key = key
    decrypted_message = decrypted_text

    break

results = [decrypted_key, decrypted_message]

# print("key")
# print("plaintext")
for result in results:
    print(result)
