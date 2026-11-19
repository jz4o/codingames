# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
cards = input().split()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

temp_cards = cards.copy()
results = []
while len(temp_cards) > 0:
    if len(results) > 0:
        results.insert(0, results.pop())
    results.insert(0, temp_cards.pop())

result = ' '.join(results)

# print("answer")
print(result)
