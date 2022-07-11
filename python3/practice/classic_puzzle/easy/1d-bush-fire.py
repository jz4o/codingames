# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
lines = []
for i in range(n):
    line = input()
    lines.append(line)
for i in range(n):

    # Write an answer using print
    # To debug: print("Debug messages...", file=sys.stderr, flush=True)

    line = lines.pop(0)
    indexes = [index for index, char in enumerate(line) if char == 'f']

    drop_count = 0
    while len(indexes) > 0:
        index = indexes.pop(0)

        drop_count += 1

        indexes = [i for i in indexes if i > index + 2]

    result = drop_count

    # print("answer")
    print(result)
