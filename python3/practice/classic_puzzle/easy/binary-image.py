import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

h = int(input())
rows = []
for i in range(h):
    row = input()
    rows.append(row)
results = []
for i in range(h):

    # Write an answer using print
    # To debug: print("Debug messages...", file=sys.stderr, flush=True)

    # print("answer")

    row = rows[i]

    result = ''
    for index, length in enumerate(row.split(' ')):
        result += ('.' if index % 2 == 0 else 'O') * int(length)

    results.append(result)

if len(set(map(len, results))) != 1:
    results = ['INVALID']

for result in results:
    print(result)
