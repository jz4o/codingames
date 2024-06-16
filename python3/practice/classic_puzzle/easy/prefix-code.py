# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.


class PrefixCode:
    def __init__(self, binary, char):
        self.binary = binary
        self.char = char


n = int(input())
prefix_codes = []
for _ in range(n):
    inputs = input().split()
    b = inputs[0]
    c = int(inputs[1])

    prefix_codes.append(PrefixCode(b, chr(c)))
s = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

prefix_codes.sort(key=lambda prefix_code: len(prefix_code.binary), reverse=True)

temp_s = s

result = ''
while len(temp_s) > 0:
    filterd_prefix_codes = [prefix_code for prefix_code in prefix_codes if temp_s.startswith(prefix_code.binary)]

    if len(filterd_prefix_codes) == 0:
        result = f'DECODE FAIL AT INDEX {len(s) - len(temp_s)}'
        break

    prefix_code = filterd_prefix_codes[0]

    temp_s = temp_s.replace(prefix_code.binary, '', 1)
    result += prefix_code.char

# print("abracadabra")
print(result)
