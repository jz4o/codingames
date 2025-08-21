# import sys
# import math

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

ss = []
for _ in range(5):
    s = input()
    ss.append(s)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

CHINESE_NUMBERS = [
  '*000*0***00***00***0*000*',
  '**********00000**********',
  '00000***************00000',
  '00000******000******00000',
  '000000*0*000*000***000000',
  '00000**0***0000**0*000000',
  '**0****0**00000*0*0*0***0',
  '**0****0**00000**0****000',
  '*0*0**0*0**0*0**0*0*0***0',
  '**0****0**0000**0*0*0**00',
]

chinese_numbers = [
    ''.join(transposed_s)
    for transposed_s
    in pd.DataFrame(s.split(' ') for s in ss).T.to_numpy()
]
numbers = [CHINESE_NUMBERS.index(chinese_number) for chinese_number in chinese_numbers]

result = ''.join(str(number) for number in numbers)

# print("The number")
print(result)
