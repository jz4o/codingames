# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

l, s, n = [int(i) for i in input().split()]
program = ''
for i in range(l):
    r = input()

    program += r
inputs = []
for i in range(n):
    c = int(input())

    inputs.append(c)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class BrainFack:
    @classmethod
    def exec(cls, program, array_size, inputs):
        program = re.sub(r'[^><+-.,\[\]]', '', program)

        array = [0] * array_size
        pointer = 0
        output = ''

        try:
            jump_index_pairs = cls.get_jump_index_pairs(program)

            carriage = 0
            while carriage < len(program):
                if program[carriage] == '>':
                    pointer += 1
                elif program[carriage] == '<':
                    pointer -= 1
                elif program[carriage] == '+':
                    array[pointer] += 1
                elif program[carriage] == '-':
                    array[pointer] -= 1
                elif program[carriage] == '.':
                    output += chr(array[pointer])
                elif program[carriage] == ',':
                    array[pointer] = inputs.pop(0)
                elif program[carriage] == '[' and array[pointer] == 0:
                    carriage = jump_index_pairs[carriage]
                elif program[carriage] == ']' and array[pointer] != 0:
                    carriage = jump_index_pairs[carriage]

                if pointer < 0 or len(array) <= pointer:
                    raise Exception('POINTER OUT OF BOUNDS')

                if array[pointer] < 0 or 255 < array[pointer]:
                    raise Exception('INCORRECT VALUE')

                carriage += 1

            return output

        except Exception as e:
            return str(e)

    @staticmethod
    def get_jump_index_pairs(program):
        jump_index_pairs = {}
        jump_index_pair_stack = []

        for index, command in enumerate(program):
            if command == '[':
                jump_index_pair_stack.append(index)
            elif command == ']':
                if len(jump_index_pair_stack) <= 0:
                    raise Exception('SYNTAX ERROR')

                pair_index = jump_index_pair_stack.pop(-1)

                jump_index_pairs[pair_index] = index
                jump_index_pairs[index] = pair_index

        if len(jump_index_pair_stack) > 0:
            raise Exception('SYNTAX ERROR')

        return jump_index_pairs


result = BrainFack.exec(program, s, inputs)

# print("answer")
print(result)
