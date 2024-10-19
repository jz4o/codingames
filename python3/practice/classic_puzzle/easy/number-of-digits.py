# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
k = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

digits = [int(i) for i in str(n)[::-1]]

sum_count = 0
for index in range(len(digits)):
    digit = digits[index]
    digit_count = 0

    for i in range(index):
        w = 10**i
        c = 10**(index - i - 1)
        digit_count += (w * c * digit)

    if digit == k:
        kind_of_lower_digits = int(''.join([str(i) for i in digits[:index][::-1]]) or '0') + 1
        digit_count += kind_of_lower_digits
    elif digit > k:
        digit_count += 10**index

    sum_count += digit_count

result = sum_count

# print("answer")
print(result)
