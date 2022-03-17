import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

ws = []
for i in input().split():
    w = int(i)
    ws.append(w)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

first_second, first_third = ws[:2]
third_fifth, fourth_fifth = ws[-2:]
sum_all = sum(ws) // 4

third = sum_all - first_second - fourth_fifth
first = first_third - third
second = first_second - first
fifth = third_fifth - third
fourth = fourth_fifth - fifth

result = ' '.join(map(str, [first, second, third, fourth, fifth]))

# print("answer")
print(result)
