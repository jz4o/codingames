# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

name = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

AD_LIST = [
    'Adaptable',
    'Adventurous',
    'Affectionate',
    'Courageous',
    'Creative',
    'Dependable',
    'Determined',
    'Diplomatic',
    'Giving',
    'Gregarious',
    'Hardworking',
    'Helpful',
    'Hilarious',
    'Honest',
    'Non-judgmental',
    'Observant',
    'Passionate',
    'Sensible',
    'Sensitive',
    'Sincere'
]
GOOD_LIST = ['Love', 'Forgiveness', 'Friendship', 'Inspiration', 'Epic Transformations', 'Wins']
BAD_LIST = ['Crime', 'Disappointment', 'Disasters', 'Illness', 'Injury', 'Investment Loss']

AD_LIST = [ad.lower() for ad in AD_LIST]
GOOD_LIST = [good.lower() for good in GOOD_LIST]
BAD_LIST = [bad.lower() for bad in BAD_LIST]

VOWELS = list('aeiouy')
CONSONANTS = list('bcdfghjklmnpqrstvwxz')

lower_name = ''.join([char for char in name.lower() if char in VOWELS or char in CONSONANTS])

consonants = [char for char in dict.fromkeys(lower_name) if char in CONSONANTS]
first_consonant, second_consonant, third_consonant = [*consonants, None, None, None][:3]
good_vowel, bad_vowel = [*[char for char in lower_name if char in VOWELS], None, None][:2]

results = []
if all([first_consonant, second_consonant, third_consonant, good_vowel, bad_vowel]):
    first_ad = AD_LIST[CONSONANTS.index(first_consonant)]
    second_ad = AD_LIST[CONSONANTS.index(second_consonant)]
    third_ad = AD_LIST[CONSONANTS.index(third_consonant)]
    good = GOOD_LIST[VOWELS.index(good_vowel)]
    bad = BAD_LIST[VOWELS.index(bad_vowel)]

    results.append(f"It's so nice to meet you, my dear {first_ad} {name}.")
    results.append(f'I sense you are both {second_ad} and {third_ad}.')
    results.append(f'May our future together have much more {good} than {bad}.')
else:
    results.append(f'Hello {name}.')

# print("Hello Lisa.")
for result in results:
    print(result)
