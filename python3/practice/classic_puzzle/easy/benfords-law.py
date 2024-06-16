# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
transactions = []
for _ in range(n):
    transaction = input()
    transactions.append(transaction)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

benford_law_percentages = [0, 0.301, 0.176, 0.125, 0.097, 0.079, 0.067, 0.058, 0.051, 0.046]
first_numbers = [int(next(iter(re.findall('[0-9]', transaction)))) for transaction in transactions]

is_fraudulent = False
for i in range(1, 9 + 1):
    benford_law_percentage = benford_law_percentages[i]
    percent = first_numbers.count(i) / n

    if percent < benford_law_percentage - 0.1 or benford_law_percentage + 0.1 < percent:
        is_fraudulent = True
        break

result = str(is_fraudulent).lower()

# print("false")
print(result)
