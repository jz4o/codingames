# import sys
# import math

from fractions import Fraction

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
name_rs = []
for i in range(n):
    inputs = input().split()
    name = inputs[0]
    r = int(inputs[1])

    name_rs.append([name, r])
circuit = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

LEFT_PARTS = ['[', '(']
RIGHT_PARTS = [']', ')']


def calc_series(rs):
    return sum([Fraction(r) for r in rs])


def calc_parallel(rs):
    return 1 / sum([1 / Fraction(r) for r in rs])


r_dict = dict(name_rs)

temp_circuit = circuit
for k, v in r_dict.items():
    temp_circuit = temp_circuit.replace(k, str(v))

circuit_elements = temp_circuit.split()
while len(circuit_elements) >= 2:
    last_left_part_index = max([index for index, elm in enumerate(circuit_elements) if elm in LEFT_PARTS])
    pair_part_elements = circuit_elements[last_left_part_index:]
    pair_right_part_index = min([index for index, elm in enumerate(pair_part_elements) if elm in RIGHT_PARTS])
    pair_right_part_index += last_left_part_index

    last_left_part = circuit_elements[last_left_part_index]

    rs = circuit_elements[last_left_part_index + 1:pair_right_part_index]
    r = calc_parallel(rs) if last_left_part == '[' else calc_series(rs)

    circuit_elements[last_left_part_index:pair_right_part_index + 1] = [r]

result = round(float(circuit_elements[0]), 1)

# print("Equivalent Resistance")
print(result)
