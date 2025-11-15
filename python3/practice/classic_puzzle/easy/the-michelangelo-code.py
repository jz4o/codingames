# import sys
# import math

from fractions import Fraction

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

text = input()
n = int(input())
words = []
for _ in range(n):
    word = input()

    words.append(word)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

ALPHABETS = 'abcdefghijklmnopqrstuvwxyz'

text_chars = [char for char in text.lower() if char in ALPHABETS]
text_char_count = { alphabet: text_chars.count(alphabet) for alphabet in ALPHABETS }

sorted_words = sorted(words, key=len, reverse=True)

result = None
for word in sorted_words:
    word_char_count = { char: word.count(char) for char in set(word) }

    if not all(count <= text_char_count.get(char, 0) for char, count in word_char_count.items()):
        continue

    first_char = word[0]
    last_char = word[-1]
    word_length = len(word)

    first_char_indexes = [index for index, char in enumerate(text_chars) if char == first_char]
    last_char_indexes = [index for index, char in enumerate(text_chars) if char == last_char]

    for first_char_index in first_char_indexes:
        for last_char_index in last_char_indexes:
            if last_char_index <= first_char_index:
                continue

            step = (last_char_index - first_char_index) / (word_length - 1)
            if Fraction(step).denominator != 1:
                continue

            indexes = list(range(first_char_index, last_char_index + 1, int(step)))
            if ''.join(text_chars[index] for index in indexes) != word:
                continue

            secret_message_chars = [char.upper() if index in indexes else char for index, char in enumerate(text_chars)]
            secret_message = ''.join(secret_message_chars[first_char_index:last_char_index + 1])

            result = secret_message
            break

        else:
            continue
        break

    else:
        continue
    break

# print("answer")
print(result)
