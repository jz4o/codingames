# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

temp_digits = [[i] for i in range(1, n + 1)]
results = []
while len(temp_digits) > 0:
    temp_digit = temp_digits.pop()

    sum_digit = sum(temp_digit, 0)
    if sum_digit == n:
        results.append(' '.join(map(str, temp_digit)))
        continue

    temp_digits.extend([*temp_digit, i] for i in reversed(range(1, min(n - sum_digit, temp_digit[-1]) + 1)))

results.sort(reverse=True)

# print("answer")
for result in results:
    print(result)
