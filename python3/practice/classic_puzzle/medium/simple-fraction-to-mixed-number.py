import sys
import math

from fractions import Fraction

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
xys = []
for i in range(n):
    x_y = input()

    xys.append(x_y)
for i in range(n):

    # Write an answer using print
    # To debug: print("Debug messages...", file=sys.stderr, flush=True)

    x, y = map(lambda i: int(i), xys[i].split('/'))
    if y == 0:
        print('DIVISION BY ZERO')
        continue

    fraction = Fraction(x, y)
    int_part = int(fraction)
    fra_part = fraction - int_part
    if int_part < 0:
        fra_part = fra_part * -1
    if int_part == 0:
        int_part = ''
    if fra_part.numerator == 0:
        fra_part = ''

    result = f'{int_part} {fra_part}'.strip()
    if result == '':
        result = '0'

    # print("answer")
    print(result)
