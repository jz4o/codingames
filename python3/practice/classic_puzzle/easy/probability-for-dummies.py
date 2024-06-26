# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

m = int(input())
n = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Probability:
    ROULETTE_PATTERN = 38

    probability_cache = {}

    @classmethod
    def calc(cls, m, n):
        if m == 1 and n == 1:
            return 1

        if m == 0:
            return 0

        if n < m:
            return 0

        cache_key = f'{m},{n}'
        if cache_key in cls.probability_cache:
            return cls.probability_cache[cache_key]

        new_number_pattern_percent = cls.calc(m - 1, n - 1) * ((cls.ROULETTE_PATTERN - (m - 1)) / cls.ROULETTE_PATTERN)
        exist_number_pattern_percent = cls.calc(m, n - 1) * (m / cls.ROULETTE_PATTERN)

        result = new_number_pattern_percent + exist_number_pattern_percent

        cls.probability_cache[cache_key] = result

        return result

float_result = sum(Probability.calc(i, n) for i in range(m, n + 1))
result = f'{round(float_result * 100)}%'

# print("probability")
print(result)
