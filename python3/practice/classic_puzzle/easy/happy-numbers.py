import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
xs = []
for i in range(n):
    x = input()

    xs.append(x)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

HAPPY_NUMBER = 1
HAPPY_FACE = ':)'
UNHAPPY_FACE = ':('

results = []
for x in xs:
    temp = x

    exit_numbers = [HAPPY_NUMBER]
    while temp not in exit_numbers:
        exit_numbers.append(temp)
        temp = sum([int(i) ** 2 for i in str(temp)])

    result_face = HAPPY_FACE if temp == HAPPY_NUMBER else UNHAPPY_FACE

    results.append(f'{x} {result_face}')

# print("23 :)")
for result in results:
    print(result)
