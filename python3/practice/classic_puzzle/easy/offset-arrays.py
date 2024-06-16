# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
assignments = []
for _ in range(n):
    assignment = input()
    assignments.append(assignment)
x = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

assignment_dict = {}
for assignment in assignments:
    pattern = '([A-Z]+)\\[([\\-\\d]+)\\.\\.([\\-\\d]+)\\] = ([\\-\\s\\d]+)'
    array_name, range_begin, range_end, values = re.findall(pattern, assignment)[0]

    if array_name not in assignment_dict:
        assignment_dict[array_name] = {}

    target_dict = assignment_dict[array_name]
    for r, v in zip(range(int(range_begin), int(range_end) + 1), values.split(' ')):
        target_dict[str(r)] = v

result = x
while re.search('[A-Z]+\\[[\\-\\d]+\\]', result) is not None:
    array_name, key = re.findall('([A-Z]+)\\[([\\-\\d]+)\\]', result)[0]

    result = result.replace(f'{array_name}[{key}]', assignment_dict[array_name][key])

# print("0")
print(result)
