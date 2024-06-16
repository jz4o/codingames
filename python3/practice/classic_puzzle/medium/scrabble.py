# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
words = []
for _ in range(n):
    w = input()

    words.append(w)
letters = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class Result:
    def __init__(self, word, point):
        self.word = word
        self.point = point


points = {}
for c in 'eaionrtlsu':
    points[c] = 1
for c in 'dg':
    points[c] = 2
for c in 'bcmp':
    points[c] = 3
for c in 'fhvwy':
    points[c] = 4
for c in 'k':
    points[c] = 5
for c in 'jx':
    points[c] = 8
for c in 'qz':
    points[c] = 10

result = Result('', 0)
for word in words:
    chars = letters

    made_flag = True
    for w in word:
        if w not in chars:
            made_flag = False
            break

        chars = chars.replace(w, '', 1)

    if not made_flag:
        continue

    point = sum(points[w] for w in word)

    if result.point < point:
        result = Result(word, point)

# print("invalid word")
print(result.word)
