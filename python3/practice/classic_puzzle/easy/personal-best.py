# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

gymnasts = input()
categories = input()
n = int(input())
rows = []
for _ in range(n):
    row = input()
    rows.append(row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

gymnasts = gymnasts.split(',')
categories = categories.split(',')

scores = {}
for row in rows:
    gymnast, bars, beam, floor = row.split(',')
    if gymnast not in gymnasts:
        continue

    bars, beam, floor = map(float, [bars, beam, floor])

    if gymnast not in scores:
        scores[gymnast] = {'bars': 0, 'beam': 0, 'floor': 0}

    score = scores[gymnast]
    score['bars'] = max(score['bars'], bars)
    score['beam'] = max(score['beam'], beam)
    score['floor'] = max(score['floor'], floor)

results = []
for gymnast in gymnasts:
    result = ','.join([re.sub('\\.?0+$', '', str(scores[gymnast][category])) for category in categories])
    results.append(result)

# print("0.00")
for result in results:
    print(result)
