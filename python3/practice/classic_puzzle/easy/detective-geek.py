# import sys
# import math

import re

import numpy as np

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

time = input()
address = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

MONTHS = ['jan', 'feb', 'mar', 'apr', 'may', 'jun', 'jul', 'aug', 'sep', 'oct', 'nov', 'dec']

formatted_time = str(int(time.replace('*', '0').replace('#', '1'), 2)).rjust(4, '0')
formatted_time = formatted_time[:2] + ':' + formatted_time[-2:]

decrypted_address = ''
for word in address.split():
    month_chars = ''
    for month in re.findall('.{3}', word):
        month_index = MONTHS.index(month)
        month_chars += np.base_repr(month_index, len(MONTHS))

    decrypted_address += chr(int(month_chars, len(MONTHS)))

results = []
results.append(formatted_time)
results.append(decrypted_address)

# print("answer")
for result in results:
    print(result)
