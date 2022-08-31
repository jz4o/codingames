# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

operation = input()
pseudo_random_number = int(input())
rotors = []
for i in range(3):
    rotor = input()
    rotors.append(rotor)
message = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

if operation == 'ENCODE':
    message_chars = []

    for index, char in enumerate(message):
        message_chars.append(ALPHABET[(ALPHABET.index(char) + pseudo_random_number + index) % len(ALPHABET)])

    for rotor in rotors:
        message_chars = [rotor[ALPHABET.index(char)] for char in message_chars]
else:
    message_chars = list(message)

    for rotor in reversed(rotors):
        message_chars = [ALPHABET[rotor.index(char)] for char in message_chars]

    temp_message_chars = []
    for index, char in enumerate(message_chars):
        temp_message_chars.append(ALPHABET[(ALPHABET.index(char) - pseudo_random_number - index) % len(ALPHABET)])
    message_chars = temp_message_chars


result = ''.join(message_chars)

# print("message")
print(result)
