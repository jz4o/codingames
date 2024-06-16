# import sys
import itertools
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
deck = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


def faro_shuffle(deck):
    splited_deck = deck.split(' ')
    half_index = math.ceil(len(splited_deck) / 2)
    front_half = splited_deck[:half_index]
    back_half = splited_deck[half_index:]
    if len(splited_deck) % 2 == 1:
        back_half.append('')

    result = zip(front_half, back_half)
    result = itertools.chain.from_iterable(map(list, result))
    result = [elm for elm in result if elm != '']  # remove empty string
    result = ' '.join(result)

    return result


result = deck
for _ in range(n):
    result = faro_shuffle(result)

# print("answer")
print(result)
