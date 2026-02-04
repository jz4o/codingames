# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
xs = []
for _ in range(n):
    x = int(input())
    xs.append(x)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class ArabiaRoman:
    to_roman_cache = {}

    @classmethod
    def to_roman(cls, arabia: int):
        cached_result = cls.to_roman_cache.get(arabia)
        if cached_result is not None:
            return cached_result

        values = [
            [1000, 'M'],
            [500, 'D'],
            [100, 'C'],
            [50, 'L'],
            [10, 'X'],
            [5, 'V'],
            [1, 'I'],
        ]

        subtractive_notation = [
            ['DCCCC', 'CM'],
            ['CCCC', 'CD'],
            ['LXXXX', 'XC'],
            ['XXXX', 'XL'],
            ['VIIII', 'IX'],
            ['IIII', 'IV'],
        ]

        temp_arabia = arabia
        inefficient_roman = ''
        for value, roman in values:
            roman_count, temp_arabia = divmod(temp_arabia, value)

            inefficient_roman += roman * roman_count

        roman = inefficient_roman
        for variant, subtractive in subtractive_notation:
            roman = roman.replace(variant, subtractive)

        cls.to_roman_cache[arabia] = roman

        return roman

sorted_xs = sorted(xs, key=ArabiaRoman.to_roman)
result = ' '.join([str(x) for x in sorted_xs])

# print("50 60 40")
print(result)
