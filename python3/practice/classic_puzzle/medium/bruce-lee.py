# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

encrypt = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

KIND_OF_FIRST_SEQUENCE = ['0', '00']

encrypts = encrypt.split(' ')

invalid_flag = False
binaries = ''
if len(encrypts) % 2 != 0:
    invalid_flag = True
else:
    for i in range(0, len(encrypts), 2):
        binary = encrypts[i]
        count = encrypts[i + 1]

        if binary not in KIND_OF_FIRST_SEQUENCE:
            invalid_flag = True
            break

        binaries += ('1' if binary == '0' else '0') * len(count)

results = []
if invalid_flag or len(binaries) % 7 != 0:
    results.append('INVALID')
else:
    result = ''.join([chr(int(binary, 2)) for binary in re.findall('.{7}', binaries)])
    results.append(result)

# print("INVALID")
for result in results:
    print(result)
