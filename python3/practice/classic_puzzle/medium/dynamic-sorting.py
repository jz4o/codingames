# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

expression = input()
types = input()
n = int(input())
rows = []
for i in range(n):
    row = input()
    rows.append(row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

expressions = re.findall('[-+][a-z]+', expression)
int_expressions = [express[1:] for express, t in zip(expressions, types.split(',')) if t == 'int']

objects = []
for row in rows:
    obj = {}
    for column in row.split(','):
        k, v = column.split(':')
        obj[k] = int(v) if k in int_expressions else v
    objects.append(obj)

objects = sorted(objects, key=lambda x: x['id'])
for express in reversed(expressions):
    objects = sorted(objects, key=lambda x: x[express[1:]], reverse=express[0] == '-')

results = [obj['id'] for obj in objects]

# print("answer")
for result in results:
    print(result)
