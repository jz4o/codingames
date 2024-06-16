# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
words = []
for _ in range(n):
    word = input()
    words.append(word)
for i in range(n):

    # Write an answer using print
    # To debug: print("Debug messages...", file=sys.stderr, flush=True)

    word = words[i]
    prefix_length = None
    for length in range(1, len(word) + 1):
        if len([w for w in words if w.startswith(word[:length])]) == 1:
            prefix_length = length
            break

    result = word[:prefix_length] if prefix_length is not None else word

    # print("<word_prefix>")
    print(result)
