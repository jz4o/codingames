# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

a = input()
b = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

a_list = [int(s) for s in a.split()]
b_list = [int(s) for s in b.split()]

result = 0
while len(a_list) > 0:
    a_length, a_value = a_list[:2]
    del a_list[:2]

    b_length, b_value = b_list[:2]
    del b_list[:2]

    length = min(a_length, b_length)
    value = a_value * b_value

    result += value * length

    if length < a_length:
        a_list[0:0] = [a_length - length, a_value]
    else:
        b_list[0:0] = [b_length - length, b_value]

# print("a DOT b")
print(result)
