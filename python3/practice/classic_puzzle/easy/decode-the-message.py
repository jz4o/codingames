import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

p = int(input())
c = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

result = ''
i = p + 1
while i > 0:
    i, mod = divmod(i, len(c))
    if mod == 0:
        i -= 1

    result += c[mod - 1]

# print("Good Luck :->")
print(result)
