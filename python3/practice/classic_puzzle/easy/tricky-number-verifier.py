# import sys
# import math

import datetime
import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
numbers = []
for _ in range(n):
    number = input()
    numbers.append(number)
# for i in range(n):
#
#     # Write an answer using print
#     # To debug: print("Debug messages...", file=sys.stderr, flush=True)
#
#     print("answer")

def calc_check_digit(lll, ddmmyy):
    sum_value = sum(
        int(l) * int(r)
        for l, r
        in zip(f'{lll}{ddmmyy}', '379584216')
    )

    return sum_value % 11

for number in numbers:
    result = None

    if re.fullmatch(r'[1-9]\d{9}', number) is None:
        result = 'INVALID SYNTAX'

    if result is None:
        lll, x, ddmmyy = next(iter(re.findall(r'(.{3})(.{1})(.{6})', number)))

    if result is None:
        try:
            datetime.datetime.strptime(ddmmyy, r'%d%m%y')
        except ValueError:
            result = 'INVALID DATE'

    if result is None:
        check_digit = calc_check_digit(lll, ddmmyy)
        if check_digit == int(x):
            result = 'OK'

    while result is None:
        check_digit = calc_check_digit(lll, ddmmyy)
        if check_digit != 10:
            result = f'{lll}{check_digit}{ddmmyy}'

        lll = str(int(lll) + 1)

    print(result)
