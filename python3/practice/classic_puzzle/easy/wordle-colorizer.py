# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

answer = input()
n = int(input())
attempts = []
for _ in range(n):
    attempt = input()
    attempts.append(attempt)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

results = []
for attempt in attempts:
    answer_chars = list(answer)
    attempt_chars = list(attempt)

    right_indexes = [
        index
        for index, char
        in enumerate(attempt_chars)
        if answer_chars[index] == char
    ]
    for index in reversed(right_indexes):
        del answer_chars[index]

    result_chars = []
    for index, attempt_char in enumerate(attempt_chars):
        if index in right_indexes:
            result_chars.append('#')
        elif attempt_char in answer_chars:
            del answer_chars[answer_chars.index(attempt_char)]
            result_chars.append('O')
        else:
            result_chars.append('X')

    result = ''.join(result_chars)

    results.append(result)

# print("OXOXO")
for result in results:
    print(result)
