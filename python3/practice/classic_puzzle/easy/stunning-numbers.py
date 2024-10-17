# import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class StunningNumber:
    STUNNING_DIGITS = [0, 1, 2, 5, 8]
    FLIPPABLE_DIGITS = [0, 1, 2, 5, 6, 8, 9]
    NOT_FLIPPABLE_DIGITS = [3, 4, 7]

    def __init__(self, number):
        self.number = int(number)

    def is_stunning(self):
        return str(str(self.number) == self.__flip(self.number)).lower()

    def get_next_stunning_number(self, number = None):
        temp_number = str(number or self.number)

        length = len(temp_number)
        front_length = math.ceil(length / 2)
        front = temp_number[:front_length]
        front_digits = [*[int(d) for d in str(int(front) + 1)[::-1]], 0]

        not_flippable_indexes = [index for index, d in enumerate(front_digits) if d in self.NOT_FLIPPABLE_DIGITS]
        if len(not_flippable_indexes) > 0:
            not_flippable_index = not_flippable_indexes[-1]
            not_flippable_digit = front_digits[not_flippable_index]
            replaced_digit = next(iter([d for d in self.FLIPPABLE_DIGITS if not_flippable_digit < d]))
            front_digits[not_flippable_index] = replaced_digit
            if not_flippable_index > 0:
                front_digits[:not_flippable_index] = [0] * not_flippable_index

        if front_digits[-1] == 0:
            front_digits.pop()

        result_front = ''.join([str(d) for d in front_digits[::-1]])
        back_length = length - front_length
        result_number = f'{result_front}{self.__flip(result_front[:back_length])}'

        if len(result_number) % 2 == 1:
            center_index = math.floor(len(result_number) / 2)
            center_digit = int(result_number[center_index])
            if center_digit not in self.STUNNING_DIGITS:
                next_stunning_digit = next(iter([d for d in self.STUNNING_DIGITS if center_digit < d]), None)
                if next_stunning_digit is None:
                    return self.get_next_stunning_number(result_number)

                result_number = f'{result_number[:center_index]}{next_stunning_digit}{result_number[center_index:]}'

        return StunningNumber(result_number)

    def __str__(self):
        return str(self.number)

    def __flip(self, number):
        return str(number).translate(str.maketrans('0123456789', '012XX59786'))[::-1]

stunning_number = StunningNumber(n)

results = [
    stunning_number.is_stunning(),
    stunning_number.get_next_stunning_number(),
]

# print("true")
# print("69")
for result in results:
    print(result)
