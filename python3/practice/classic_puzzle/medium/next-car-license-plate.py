# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

x = input()
n = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


def alpha_to_int(alpha):
    alphabets = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

    result = 0
    for index, char in enumerate(reversed(alpha)):
        alpha_index = alphabets.index(char) + 1

        result += pow(len(alphabets), index) * alpha_index

    return result


def int_to_alpha(alpha_int):
    alphabets = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

    result = ''
    while alpha_int > 0:
        i = alpha_int % len(alphabets)
        if i == 0:
            i = len(alphabets)
            alpha_int -= 1

        alpha_int = alpha_int // len(alphabets) if alpha_int > len(alphabets) else 0

        result = alphabets[i - 1] + result

    return result


ab, cde, fg = x.split('-')
cde = int(cde)

alpha_int = alpha_to_int(ab + fg)

carry, cde = divmod(cde + n - 1, 999)
alpha = int_to_alpha(alpha_int + carry)

next_ab = alpha[:2]
next_cde = str(cde + 1).zfill(3)
next_fg = alpha[-2:]

result = '-'.join([next_ab, next_cde, next_fg])

# print("AA-000-AA")
print(result)
