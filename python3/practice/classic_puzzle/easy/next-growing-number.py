# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

digits = list(map(int, str(int(n) + 1)))

increment_index = next(iter([index for index in range(len(digits) - 1) if digits[index] > digits[index + 1]]))
increment_number = digits[increment_index]
for index in range(increment_index + 1, len(digits)):
    digits[index] = increment_number

result = ''.join(map(str, digits))

# print("answer")
print(result)
