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
    i = 2
    while i < num:
        if num % i == 0:
            return False

        i += 1

    return True


is_carmichael = not is_prime(n)
for prime_factor in prime_division(n):
    if (n - 1) % (prime_factor - 1) != 0:
        is_carmichael = False
        break

result = "YES" if is_carmichael else "NO"

# print("YES|NO")
print(result)
