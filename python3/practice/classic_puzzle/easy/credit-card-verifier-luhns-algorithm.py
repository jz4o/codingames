import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
cards = []
for i in range(n):
    card = input()
    cards.append(card)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

results = []
for card in cards:
    sum_numbers = 0
    for index, number in enumerate(map(int, card.replace(' ', ''))):
        if index % 2 == 0:
            number *= 2
            if number >= 10:
                number -= 9

        sum_numbers += number

    results.append('YES' if sum_numbers % 10 == 0 else 'NO')

# print("YES or NO")
for result in results:
    print(result)
