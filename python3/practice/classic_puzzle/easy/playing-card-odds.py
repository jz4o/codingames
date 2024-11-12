# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

r, s = [int(i) for i in input().split()]
removed_list = []
for _ in range(r):
    removed = input()
    removed_list.append(removed)
sought_list = []
for _ in range(s):
    sought = input()
    sought_list.append(sought)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Card:
    def __init__(self, rank, suit):
        self.rank = rank
        self.suit = suit

RANKS = list('23456789TJQKA')
SUITS = list('CDHS')

def is_applicable(card, condition):
    condition_chars = set(condition)
    condition_ranks = condition_chars & set(RANKS)
    condition_suits = condition_chars & set(SUITS)

    is_applicable_rank = len(condition_ranks) == 0 or card.rank in condition_ranks
    is_applicable_suit = len(condition_suits) == 0 or card.suit in condition_suits

    return is_applicable_rank and is_applicable_suit

cards = []
for rank in RANKS:
    cards.extend(Card(rank, suit) for suit in SUITS)

remain_cards = [
    card
    for card
    in cards
    if all(not is_applicable(card, removed) for removed in removed_list)
]

sought_card = [
    card
    for card
    in remain_cards
    if any(is_applicable(card, sought) for sought in sought_list)
]

percentage = round(len(sought_card) / len(remain_cards) * 100)
result = f'{percentage}%'

# print("2%")
print(result)
