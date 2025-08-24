# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

expression = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Instruction:
    def __init__(self, type_value, operand):
        self.type_value = type_value
        self.operand = operand

    def __eq__(self, other):
        return isinstance(other, Instruction) and self.type_value == other.type_value and self.operand == other.operand

    def __hash__(self):
        return hash((self.type_value, self.operand))

def each_slice(target_list: list, n: int):
    return [target_list[i:i + n] for i in range(0, len(target_list), n)]

expression_elements = expression.split(' ')
if re.match(r'\d', expression_elements[0]):
    expression_elements.insert(0, '+')

instructions = [
    Instruction(type_value, operand)
    for type_value, operand
    in each_slice(expression_elements, 2)
]

results = []
while len(instructions) > 0:
    instruction = instructions[0]
    repeat_count = instructions.count(instruction)
    if repeat_count > 1:
        results.append(f'REPEAT {repeat_count}')

    results.append(f'{"ADD" if instruction.type_value == "+" else "SUB"} cgx {instruction.operand}')

    instructions = [
        inst
        for inst
        in instructions
        if inst != instruction
    ]
results.append('EXIT')

# print("ADD cgx 1")
# print("write EXIT")
for result in results:
    print(result)
