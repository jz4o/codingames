import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

class Player:
    DECISION_TABLE = {
        'R': {
            'R': 'draw',
            'P': 'lose',
            'C': 'win',
            'L': 'win',
            'S': 'lose'
        },
        'P': {
            'R': 'win',
            'P': 'draw',
            'C': 'lose',
            'L': 'lose',
            'S': 'win'
        },
        'C': {
            'R': 'lose',
            'P': 'win',
            'C': 'draw',
            'L': 'win',
            'S': 'lose'
        },
        'L': {
            'R': 'lose',
            'P': 'win',
            'C': 'lose',
            'L': 'draw',
            'S': 'win'
        },
        'S': {
            'R': 'win',
            'P': 'lose',
            'C': 'win',
            'L': 'lose',
            'S': 'draw'
        }
    }

    def __init__(self, num, sign):
        self.num = num
        self.sign = sign
        self.competed_nums = []

    def compete(self, other):
        return self.DECISION_TABLE[self.sign][other.sign]


n = int(input())
players = []
for i in range(n):
    inputs = input().split()
    numplayer = int(inputs[0])
    signplayer = inputs[1]

    players.append(Player(numplayer, signplayer))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

while len(players) > 1:
    winners = []
    for index in range(0, len(players), 2):
        left, right = players[index:index + 2]

        winner, loser = Player(0, 'R'), Player(0, 'R') # dummy players
        compete = left.compete(right)
        if compete == 'win':
            winner, loser = left, right
        elif compete == 'draw':
            winner, loser = sorted([left, right], key=lambda player: player.num)
        elif compete == 'lose':
            winner, loser = right, left

        winner.competed_nums.append(loser.num)
        winners.append(winner)

    players = winners

winner = players[0]

# print("WHO IS THE WINNER?")
print(winner.num)
print(' '.join(map(str, winner.competed_nums)))
