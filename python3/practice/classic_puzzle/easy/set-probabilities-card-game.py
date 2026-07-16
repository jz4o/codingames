# import sys
# import math

from dataclasses import dataclass
from itertools import combinations

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())  # the number of cards on the table
rows = []
for _ in range(n):
    inputs = input().split()
    number = int(inputs[0])
    shading = inputs[1]
    color = inputs[2]
    shape = inputs[3]

    rows.append((number, shading, color, shape))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

NUMBERS = [1, 2, 3]
SHADINGS = ['OUTLINED', 'STRIPED', 'SOLID']
COLORS = ['RED', 'GREEN', 'PURPLE']
SHAPES = ['DIAMOND', 'OVAL', 'SQUIGGLE']

@dataclass
class Card:
    number: int
    shading: str
    color: str
    shape: str

def is_set(cards):
    return (
        len(cards) == 3
        and len({card.number for card in cards}) in [1, 3]
        and len({card.shading for card in cards}) in [1, 3]
        and len({card.color for card in cards}) in [1, 3]
        and len({card.shape for card in cards}) in [1, 3]
    )

table_cards = [
    Card(number, shading, color, shape)
    for number, shading, color, shape
    in rows
]

all_cards = []
for number in NUMBERS:
    for shading in SHADINGS:
        for color in COLORS:
            all_cards.extend(Card(number, shading, color, shape) for shape in SHAPES)

deck_cards = [card for card in all_cards if card not in table_cards]

expect_cards = []
if any(is_set(cards) for cards in combinations(table_cards, 3)):
    expect_cards = deck_cards
else:
    card_combinations = list(combinations(table_cards, 2))
    expect_cards = [
        deck_card
        for deck_card
        in deck_cards
        if any(is_set([*cards, deck_card]) for cards in card_combinations)
    ]

result = str(round(len(expect_cards) / len(deck_cards), 4)).ljust(6, '0')

# print("0.5000")
print(result)
