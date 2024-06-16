# import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

rounds = int(input())
cash = int(input())
plays = []
for _ in range(rounds):
    play = input()

    plays.append(play)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

for play in plays:
    ball, call, number, *_ = (*play.split(' '), None, None, None)
    ball = int(ball)
    number = int(number) if number else None

    bet = math.ceil(cash / 4)
    cash -= bet

    if call == 'PLAIN' and ball == number:
        cash += bet * 36
    elif call == 'ODD' and ball % 2 == 1:
        cash += bet * 2
    elif call == 'EVEN' and ball % 2 == 0 and ball > 0:
        cash += bet * 2

# print("cash of the target after playing")
print(cash)
