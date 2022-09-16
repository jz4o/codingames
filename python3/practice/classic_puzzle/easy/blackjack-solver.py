# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

bank_cards = input()
player_cards = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class Hand:
    def __init__(self, cards):
        self.cards = cards.split()

        self.card_points = [int(re.sub('J|Q|K', '10', card).replace('A', '1')) for card in self.cards]

        self.point = sum(self.card_points)
        if 1 in self.card_points and self.point <= 11:
            self.point += 10
        if self.point > 21:
            self.point = 0

    def is_burst(self):
        return self.point == 0

    def is_blackjack(self):
        return self.card_points == [1, 10]


bank_hand = Hand(bank_cards)
player_hand = Hand(player_cards)

result = None
if player_hand.is_blackjack() and not bank_hand.is_blackjack():
    result = 'Blackjack!'
elif player_hand.point < bank_hand.point or (bank_hand.is_burst() and player_hand.is_burst()):
    result = 'Bank'
elif bank_hand.point < player_hand.point:
    result = 'Player'
else:
    result = 'Draw'

# print("Blackjack!")
print(result)
