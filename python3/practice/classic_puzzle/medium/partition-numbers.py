# import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

t = int(input())
ns = []
for _ in range(t):
    n = int(input())
    ns.append(n)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Calculator:
    cache = {}

    @classmethod
    def calc_partition_number(cls, sum_number, max_number):
        if sum_number <= 1:
            return 1
        if max_number <= 1:
            return 1
        if sum_number < max_number:
            return cls.calc_partition_number(sum_number, sum_number)
        if f'{sum_number}:{max_number}' in cls.cache:
            return cls.cache[f'{sum_number}:{max_number}']

        result = 1
        for number in range(2, max_number + 1):
            for n in range(1, math.floor(sum_number / number) + 1):
                result += cls.calc_partition_number(sum_number - (number * n), number - 1)

        cls.cache[f'{sum_number}:{max_number}'] = result

        return result

results = [
    Calculator.calc_partition_number(n, n)
    for n
    in ns
]

# print("partitions")
for result in results:
    print(result)
