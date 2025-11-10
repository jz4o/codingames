# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

program = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

instruction_regexp = {
    'add': r'/\$.*?/',
    'sub': r'//.*?/',
    'mul_plus_one': r'/\*\*.*?/',
    'mul_minus': r'/\*/.*?/',
    'nop': r'/\*\$',
    'add_inst_count': r'\$',
}

union_regexp_source = '|'.join(f'{regexp}' for regexp in instruction_regexp.values())
instructions = re.findall(union_regexp_source, program)

register = 0
inst_count = 0
is_inst_counting = False
for instruction in instructions:
    if re.fullmatch(instruction_regexp['add'], instruction):
        register += (len(instruction) - 3)
        inst_count += 1
    elif re.fullmatch(instruction_regexp['sub'], instruction):
        register -= (len(instruction) - 3)
        inst_count += 1
    elif re.fullmatch(instruction_regexp['mul_plus_one'], instruction):
        register *= (len(instruction) - 4 + 1)
        inst_count += 1
    elif re.fullmatch(instruction_regexp['mul_minus'], instruction):
        register *= ((len(instruction) - 4) * -1)
        inst_count += 1
    elif re.fullmatch(instruction_regexp['nop'], instruction):
        inst_count += 1
    elif re.fullmatch(instruction_regexp['add_inst_count'], instruction):
        if is_inst_counting:
            register += inst_count

        inst_count = 0
        is_inst_counting = not is_inst_counting

result = register

# print("answer")
print(result)
