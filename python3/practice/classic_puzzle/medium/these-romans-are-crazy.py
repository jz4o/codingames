import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

class Roman:
    @staticmethod
    def from_arabia(arabia):
        values = {
            1000: 'M',
            500: 'D',
            100: 'C',
            50: 'L',
            10: 'X',
            5: 'V',
            1: 'I'
        }

        subtractive_notation = {
            'DCCCC': 'CM',
            'CCCC': 'CD',
            'LXXXX': 'XC',
            'XXXX': 'XL',
            'VIIII': 'IX',
            'IIII': 'IV'
        }

        result = ''
        for value, roman in values.items():
            roman_count = int(arabia / value)
            arabia = arabia % value

            result += roman * roman_count

        for variant, subtractive in subtractive_notation.items():
            result = result.replace(variant, subtractive)

        return result

    @staticmethod
    def to_arabia(roman):
        values = {
            'I': 1,
            'V': 5,
            'X': 10,
            'L': 50,
            'C': 100,
            'D': 500,
            'M': 1000
        }

        subtractive_notation = {
            'CM': 'DCCCC',
            'CD': 'CCCC',
            'XC': 'LXXXX',
            'XL': 'XXXX',
            'IX': 'VIIII',
            'IV': 'IIII'
        }

        for subtractive, variant in subtractive_notation.items():
            roman = roman.replace(subtractive, variant)

        return sum(map(lambda c: values[c], roman))


rom_1 = input()
rom_2 = input()

arabia_1 = Roman.to_arabia(rom_1)
arabia_2 = Roman.to_arabia(rom_2)
result = Roman.from_arabia(arabia_1 + arabia_2)
print(result)
