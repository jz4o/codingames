# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
ss = []
for _ in range(n):
    s = input()
    ss.append(s)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


def int_to_alpha(num):
    alphabets = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

    result = ''
    i = int(num)
    while i > 0:
        i, mod = divmod(i, len(alphabets))
        if mod == 0:
            i -= 1

        result = alphabets[mod - 1] + result

    return result


def alpha_to_int(alpha):
    alphabets = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

    result = 0
    for index, i in enumerate(reversed(alpha)):
        result += (len(alphabets)**index) * (alphabets.index(i) + 1)

    return result


def next_string(string):
    return int_to_alpha(alpha_to_int(string) + 1)


border_index = n // 2
border_prev, border_next = sorted(ss)[border_index - 1:border_index + 1]

border = ''
chars = list(border_prev)

for char in chars:
    border_char = f'{border}{char}'
    border_char_next = next_string(border_char)

    if border_prev <= border_char < border_next:
        border += char
        break
    elif border_prev <= border_char_next < border_next:
        border += next_string(char)
        break
    else:
        border += char

result = border

# print("answer")
print(border)
