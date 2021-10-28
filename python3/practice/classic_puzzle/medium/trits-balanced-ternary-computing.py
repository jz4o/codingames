import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

lhs = input()
op = input()
rhs = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Balance:
    @staticmethod
    def to_decimal(balance):
        result = 0
        for index, i in enumerate(reversed(balance)):
            result += (-1 if i == 'T' else int(i)) * (3**index)

        return result

    @staticmethod
    def from_decimal(decimal):
        digits = []
        while decimal != 0:
            decimal, mod = divmod(decimal, 3)
            if mod == 2:
                mod = 'T'
                decimal += 1

            digits.insert(0, str(mod))

        return '0' if len(digits) <= 0 else ''.join(digits)

decimal_lhs = Balance.to_decimal(lhs)
decimal_rhs = Balance.to_decimal(rhs)

decimal_result = None
if op == '+':
    decimal_result = decimal_lhs + decimal_rhs
elif op == '-':
    decimal_result = decimal_lhs - decimal_rhs
elif op == '*':
    decimal_result = decimal_lhs * decimal_rhs
elif op == '<<':
    decimal_result = decimal_lhs * (3**decimal_rhs)
elif op == '>>':
    decimal_result = decimal_lhs / (3**decimal_rhs)

decimal_result = int(decimal_result)

result = Balance.from_decimal(decimal_result)

# print("11T")
print(result)
