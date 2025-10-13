# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


def prime_division(num):
    result = []

    while num % 2 == 0:
        result.append(2)
        num /= 2

    i = 3
    while num != 1:
        if num % i == 0:
            result.append(i)
            num /= i
        else:
            i += 2

    return result


def is_prime(num):
    return all(num % i != 0 for i in range(2, num))


def derived_number(number):
    if is_prime(number):
        return 1

    max_prime: int = max(prime_division(number))
    mod = number // max_prime

    return mod + (max_prime * derived_number(mod))


result = derived_number(n)

# print("n_prime")
print(result)
