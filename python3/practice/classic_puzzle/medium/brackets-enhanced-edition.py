# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
expressions = []
for _ in range(n):
    expression = input()
    expressions.append(expression)
results = []
for i in range(n):

    # Write an answer using print
    # To debug: print("Debug messages...", file=sys.stderr, flush=True)

    expression = expressions[i]

    expression = ''.join(re.findall(r'[()\[\]{}<>]', expression))
    expression = expression.replace('(', ')').replace('[', ']').replace('{', '}').replace('<', '>')

    brackets = []
    for c in expression:
        if len(brackets) > 0 and c == brackets[-1]:
            brackets.pop()
        else:
            brackets.append(c)

    result = 'true' if len(brackets) <= 0 else 'false'

    results.append(result)

    # print("true")

for result in results:
    print(result)
