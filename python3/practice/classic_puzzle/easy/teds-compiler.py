# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

line = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

stack = 0
prefix_size = 0
for step, char in enumerate(line, start=1):
    stack += 1 if char == '<' else -1

    if stack == 0:
        prefix_size = step
    if stack < 0:
        break

result = prefix_size

# print("answer")
print(result)
