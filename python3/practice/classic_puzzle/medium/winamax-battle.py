import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

CARD_LANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

n = int(input())  # the number of cards for player 1
deck1 = []
for i in range(n):
    cardp_1 = input()  # the n cards of player 1

    card_lank = CARD_LANKS.index(cardp_1[:-1])
    deck1.append(card_lank)

m = int(input())  # the number of cards for player 2
deck2 = []
for i in range(m):
    cardp_2 = input()  # the m cards of player 2

    card_lank = CARD_LANKS.index(cardp_2[:-1])
    deck2.append(card_lank)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class FightResult:
    def __init__(self, winner, index):
        self.winner = winner
        self.index = index

def fight(deck1, deck2, index):
    if len(deck1) <= index or len(deck2) <= index:
        return FightResult(None, -1)

    deck1_card = deck1[index]
    deck2_card = deck2[index]

    if deck2_card < deck1_card:
        return FightResult('deck1', index)
    elif deck1_card < deck2_card:
        return FightResult('deck2', index)
    else:
        return fight(deck1, deck2, index + 4)


turn = 0
while len(deck1) > 0 and len(deck2) > 0:
    turn += 1

    fight_result = fight(deck1, deck2, 0)
    if fight_result.winner == None:
        deck1 = []
        deck2 = []

    move_cards = deck1[:fight_result.index + 1] + deck2[:fight_result.index + 1]
    deck1 = deck1[fight_result.index + 1:]
    deck2 = deck2[fight_result.index + 1:]

    if fight_result.winner == 'deck1':
        deck1.extend(move_cards)
    else:
        deck2.extend(move_cards)

# print("PAT")
if any(deck1):
    print(f'1 {turn}')
elif any(deck2):
    print(f'2 {turn}')
else:
    print('PAT')
