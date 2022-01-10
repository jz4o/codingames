import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Pattern:
    def __init__(self, numbers, count, score):
        self.numbers = numbers
        self.count = count
        self.score = score

TARGET_SCORE = 50
POSSIBLE_ROUNDS = 4

result = 0
patterns = {str(n): Pattern([n], 1, n)}

while len(patterns) > 0:
    pattern_numbers, pattern = patterns.popitem()

    # between 2 and 12 is 2 patterns for PN and N
    for i in [1, *(list(range(2, 12 + 1)) * 2)]:
        new_numbers = ' '.join(map(str, reversed([*pattern.numbers, i])))
        if new_numbers in patterns:
            patterns[new_numbers].count += pattern.count
        else:
            patterns[new_numbers] = Pattern([*pattern.numbers, i], pattern.count, pattern.score + i)

    # delete pattern for over score or over rounds
    patterns = {k: v for k, v in patterns.items() if v.score <= TARGET_SCORE and len(v.numbers) <= POSSIBLE_ROUNDS + 1}

    # add possible pattern to result
    possibilities = {k: v for k, v in patterns.items() if v.score == TARGET_SCORE}
    for k, v in possibilities.items():
        result += v.count
        del patterns[k]

# print("answer")
print(result)
