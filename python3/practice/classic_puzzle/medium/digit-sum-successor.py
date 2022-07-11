# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

digits = [0, *list(map(int, str(n)))]

decrement_digit = list(filter(lambda d: d != 0, digits))[-1]
decrement_index = ''.join(map(str, digits)).rindex(str(decrement_digit))
digits[decrement_index] -= 1

increment_digit = list(filter(lambda d: d != 9, digits[:decrement_index]))[-1]
increment_index = ''.join(map(str, digits[:decrement_index])).rindex(str(increment_digit))
digits[increment_index] += 1

digits[increment_index + 1:] = sorted(digits[increment_index + 1:])

result = int(''.join(map(str, digits)))

# print("11")
print(result)
