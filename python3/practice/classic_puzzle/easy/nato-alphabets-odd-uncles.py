# import sys
# import math

from functools import reduce

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

a_word_spelled_out = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

YEAR_1908_ALPHABETS = [
    'Authority', 'Bills', 'Capture', 'Destroy', 'Englishmen', 'Fractious', 'Galloping', 'High', 'Invariably',
    'Juggling', 'Knights', 'Loose', 'Managing', 'Never', 'Owners', 'Play', 'Queen', 'Remarks', 'Support',
    'The', 'Unless', 'Vindictive', 'When', 'Xpeditiously', 'Your', 'Zigzag',
]
YEAR_1917_ALPHABETS = [
    'Apples', 'Butter', 'Charlie', 'Duff', 'Edward', 'Freddy', 'George', 'Harry', 'Ink', 'Johnnie', 'King',
    'London', 'Monkey', 'Nuts', 'Orange', 'Pudding', 'Queenie', 'Robert', 'Sugar', 'Tommy', 'Uncle', 'Vinegar',
    'Willie', 'Xerxes', 'Yellow', 'Zebra',
]
YEAR_1927_ALPHABETS = [
    'Amsterdam', 'Baltimore', 'Casablanca', 'Denmark', 'Edison', 'Florida', 'Gallipoli', 'Havana', 'Italia',
    'Jerusalem', 'Kilogramme', 'Liverpool', 'Madagascar', 'New-York', 'Oslo', 'Paris', 'Quebec', 'Roma',
    'Santiago', 'Tripoli', 'Uppsala', 'Valencia', 'Washington', 'Xanthippe', 'Yokohama', 'Zurich',
]
YEAR_1956_ALPHABETS = [
    'Alfa', 'Bravo', 'Charlie', 'Delta', 'Echo', 'Foxtrot', 'Golf', 'Hotel', 'India', 'Juliett', 'Kilo', 'Lima',
    'Mike', 'November', 'Oscar', 'Papa', 'Quebec', 'Romeo', 'Sierra', 'Tango', 'Uniform', 'Victor', 'Whiskey',
    'X-ray', 'Yankee', 'Zulu',
]

NATO_ALPHABETS = pd.DataFrame([
    YEAR_1908_ALPHABETS,
    YEAR_1917_ALPHABETS,
    YEAR_1927_ALPHABETS,
    YEAR_1956_ALPHABETS,
]).T.to_numpy()

ALPHABETS = list('ABCDEFGHIJKLMNOPQRSTUVWXYZ')

nato_indexes = []
for word in a_word_spelled_out.split(' '):
    start_char_index = ALPHABETS.index(next(iter(word)))
    target_nato_alphabets = NATO_ALPHABETS[start_char_index]

    nato_indexes.append([
        index
        for index, nato_alphabet
        in enumerate(target_nato_alphabets)
        if nato_alphabet == word
    ])

nato_index = next(iter(reduce(lambda result, elm: {*result} & {*elm}, nato_indexes)))

result_chars = []
for word in a_word_spelled_out.split():
    start_char_index = ALPHABETS.index(next(iter(word)))
    target_nato_alphabets = NATO_ALPHABETS[start_char_index]

    next_nato_index = (nato_index + 1) % len(target_nato_alphabets)

    result_chars.append(target_nato_alphabets[next_nato_index])

result = ' '.join(result_chars)

# print("answer")
print(result)
