# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

import re


class Calculator:
    DECIMAL_PLACES = 3

    def __init__(self):
        self.num1 = ''
        self.operation = ''
        self.num2 = ''
        self.pressed_equal = False
        self.display = ''

    def press(self, key):
        if key in '0123456789':
            if self.pressed_equal:
                self.__init__()

            if self.operation == '':
                self.num1 += key
                self.display = self.num1
            else:
                self.num2 += key
                self.display = self.num2
        elif key in '+-x/':
            if self.num2 != '' and self.pressed_equal is False:
                self.calc()

            self.operation = key

            self.num2 = ''
            self.pressed_equal = False

            self.display = self.num1
        elif key == '=':
            self.pressed_equal = True

            self.display = self.calc()
        elif key == 'AC':
            self.__init__()

            self.display = '0'

    def calc(self):
        num1 = float(self.num1 or '0')
        num2 = float(self.num2 or '0')

        result = 0
        if self.operation == '+':
            result = num1 + num2
        elif self.operation == '-':
            result = num1 - num2
        elif self.operation == 'x':
            result = num1 * num2
        elif self.operation == '/':
            result = num1 / num2

        self.num1 = re.sub(r'\.0$', '', str(round(result, __class__.DECIMAL_PLACES)))

        return self.num1


n = int(input())
keys = []
for i in range(n):
    key = input()
    keys.append(key)
calculator = Calculator()
for i in range(n):

    # Write an answer using print
    # To debug: print("Debug messages...", file=sys.stderr, flush=True)

    key = keys[i]
    calculator.press(key)

    result = calculator.display

    # print("answer")
    print(result)
