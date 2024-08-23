# import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

a, b = [int(i) for i in input().split()]

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

def prime_division(n):
    prime_counts = []

    temp_n = n
    for prime in range(2, math.isqrt(n) + 1):
        if temp_n % prime != 0:
            continue

        count = 0
        while temp_n % prime == 0:
            temp_n //= prime
            count += 1

        prime_counts.append((prime, count))

    if temp_n >= 2:
        prime_counts.append((temp_n, 1))

    return prime_counts

xs = []
for prime, count in prime_division(a):
    exp = 0
    while prime ** (exp + 1) <= b:
        exp += 1

    sum_value = sum(b // (prime ** e) for e in range(1, exp + 1))

    xs.append(sum_value // count)

result = min(xs, default=0)

# print("answer")
print(result)
