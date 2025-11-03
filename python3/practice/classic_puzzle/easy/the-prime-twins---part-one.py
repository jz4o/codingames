# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

def is_prime(number):
    if number < 2:
        return False

    if number == 2:
        return True

    return number % 2 != 0 and all(number % i != 0 for i in range(3, number, 2))

def get_next_prime(number):
    if number < 2:
        return 2

    temp_number = number + 1 if number % 2 == 0 else number + 2
    while not is_prime(temp_number):
        temp_number += 2

    return temp_number

left = get_next_prime(n)
right = get_next_prime(left)
while right != left + 2:
    left = right
    right = get_next_prime(left)

result = f'{left} {right}'

# print("answer")
print(result)
