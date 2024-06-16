# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

word = input()
chars = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

BEAM = '+--+'
NO_HEAD = '|'
HEAD = '|  o'
NO_BODY = '|'
BODY = '|  |'
ONE_ARM = '| /|'
BOTH_ARM = '| /|\\'
NO_LEG = '|\\'
ONE_LEG = '|\\/'
BOTH_LEG = '|\\/ \\'
HANGMAN_STATUS = [
    [BEAM, NO_HEAD, NO_BODY, NO_LEG],
    [BEAM, HEAD, NO_BODY, NO_LEG],
    [BEAM, HEAD, BODY, NO_LEG],
    [BEAM, HEAD, ONE_ARM, NO_LEG],
    [BEAM, HEAD, BOTH_ARM, NO_LEG],
    [BEAM, HEAD, BOTH_ARM, ONE_LEG],
    [BEAM, HEAD, BOTH_ARM, BOTH_LEG],
]

guessed = ''.join([char if char.lower() in chars else '_' for char in word])

lower_word = word.lower()
errors = 0
for char in chars.split(' '):
    if char in lower_word:
        lower_word = lower_word.replace(char, '')
    else:
        errors += 1

results = [*HANGMAN_STATUS[errors], guessed]

# print(guessed)
for result in results:
    print(result)
