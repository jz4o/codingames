# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

typed_keys = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

before_chars = []
after_chars = []

for char in typed_keys:
    if char == '<':
        if len(before_chars) > 0:
            after_chars.insert(0, before_chars.pop())
    elif char == '>':
        if len(after_chars) > 0:
            before_chars.append(after_chars.pop(0))
    elif char == '-':
        if len(before_chars) > 0:
            before_chars.pop()
    else:
        before_chars.append(char)

result = ''.join(before_chars + after_chars)

# print("computed text")
print(result)
