import sys
import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

phrase = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

def get_alphabets_every_by(num):
    alphabets = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

    return [alphabet for index, alphabet in enumerate(alphabets) if (index + 1) % num == 0]


def get_indexes(string, search_slice):
    return [index for index, s in enumerate(string) if s in search_slice]


def part_shift(string, indexes):
    result = string

    for index in range(len(indexes) - 1):
        index_in_string = indexes[index]
        next_index_in_string = indexes[index + 1]

        left = min(index_in_string, next_index_in_string)
        right = abs(index_in_string - next_index_in_string) - 1

        result = re.sub(f'(.{{{left}}})(.)(.{{{right}}})(.)(.*)', r'\1\4\3\2\5', result)

    return result


def part_unshift(str, indexes):
    return part_shift(str, list(reversed(indexes)))


def part_reverse(string, indexes):
    result = string

    while len(indexes) >= 2:
        shift_index = indexes.pop(0)
        pop_index = indexes.pop()

        left = min(shift_index, pop_index)
        right = abs(shift_index - pop_index) - 1

        result = re.sub(f'(.{{{left}}})(.)(.{{{right}}})(.)(.*)', r'\1\4\3\2\5', result)

    return result


size_of_words = list(map(lambda word: len(word), phrase.split(' ')))
phrase_chars = [c for c in phrase if c.strip() != '']

words = []
for size_of_word in reversed(size_of_words):
    word = ''.join(phrase_chars[:size_of_word])
    words.append(word)

    phrase_chars = phrase_chars[size_of_word:]

temp_phrase = ' '.join(words)

temp_phrase = part_unshift(temp_phrase, get_indexes(temp_phrase, get_alphabets_every_by(4)))
temp_phrase = part_shift(temp_phrase, get_indexes(temp_phrase, get_alphabets_every_by(3)))
temp_phrase = part_reverse(temp_phrase, get_indexes(temp_phrase, get_alphabets_every_by(2)))

# print("answer")
print(temp_phrase)
