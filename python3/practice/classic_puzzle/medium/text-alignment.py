import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

alignment = input()
n = int(input())
texts = []
for i in range(n):
    text = input()

    texts.append(text)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

def justify(text, width):
    if width == len(text):
        return text

    words = text.split()
    space_size = width - len(''.join(words))
    each_space_size = space_size / (len(words) - 1)
    space_sizes = [int(each_space_size * i) - int(each_space_size * (i - 1)) for i in range(1, len(words))]
    space_sizes.append(0)

    return ''.join([f'{words[i]}{" " * space_sizes[i]}' for i in range(len(words))])


width = max(map(lambda text: len(text), texts))

results = []
if alignment == 'LEFT':
    results = texts
elif alignment == 'RIGHT':
    results = map(lambda text: text.rjust(width), texts)
elif alignment == 'CENTER':
    results = map(lambda text: text.center(width).rstrip(), texts)
elif alignment == 'JUSTIFY':
    results = map(lambda text: justify(text, width), texts)

# print("answer")
for result in results:
    print(result)
