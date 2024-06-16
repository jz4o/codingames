# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
message = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


def decode(text):
    result = ''
    turn = 1
    while sum(range(1, turn + 1)) < len(text):
        turn += 1

    while turn > 0:
        slice_size = len(text) - sum(range(1, turn))

        if turn % 2 == 1:
            result = f'{text[-slice_size:]}{result}'
            text = text[:-slice_size]
        else:
            result = f'{text[:slice_size]}{result}'
            text = text[slice_size:]

        turn -= 1

    return result


def encode(text):
    result = ''
    turn = 1

    target = text[:turn]
    text = text[turn:]
    while len(target) > 0:
        if turn % 2 == 1:
            result += target
        else:
            result = f'{target}{result}'

        turn += 1

        target = text[:turn]
        text = text[turn:]

    return result


function = decode if n > 0 else encode
result = message
for _ in range(abs(n)):
    result = function(result)

# print("answer")
print(result)
