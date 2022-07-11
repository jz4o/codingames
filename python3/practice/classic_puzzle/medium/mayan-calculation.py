# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

mayan_base = 20

l, h = [int(i) for i in input().split()]
ascii_mayans = [''] * mayan_base
for i in range(h):
    numeral = input()
    for index, mayan in enumerate(re.findall(f'.{{{l}}}', numeral)):
        ascii_mayans[index] += mayan
s1 = int(input())
mayan_1 = ''
for i in range(s1):
    num_1line = input()
    mayan_1 += num_1line
s2 = int(input())
mayan_2 = ''
for i in range(s2):
    num_2line = input()
    mayan_2 += num_2line
operation = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

mayan_to_int = dict(zip(ascii_mayans, range(len(ascii_mayans))))

mayan_length = h * l

num1 = 0
for index, mayan in enumerate(reversed(re.findall(f'.{{{mayan_length}}}', mayan_1))):
    num1 += mayan_to_int[mayan] * (mayan_base ** index)
num2 = 0
for index, mayan in enumerate(reversed(re.findall(f'.{{{mayan_length}}}', mayan_2))):
    num2 += mayan_to_int[mayan] * (mayan_base ** index)

result_num = 0
if operation == '+':
    result_num = num1 + num2
elif operation == '-':
    result_num = num1 - num2
elif operation == '*':
    result_num = num1 * num2
elif operation == '/':
    result_num = num1 // num2

result_str = ''
while True:
    result_str = ascii_mayans[result_num % mayan_base] + result_str
    result_num = result_num // mayan_base

    if result_num <= 0:
        break

results = re.findall(f'.{{{l}}}', result_str)

# print("result")
for result in results:
    print(result)
