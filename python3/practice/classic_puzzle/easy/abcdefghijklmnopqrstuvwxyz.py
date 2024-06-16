# import sys
# import math

import itertools

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
ms = []
for _ in range(n):
    m = input()
    ms.append(m)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class Mass:
    def __init__(self, row_index, column_index, value):
        self.row_index = row_index
        self.column_index = column_index
        self.value = value


mass_grid = [
    [Mass(row_index, column_index, value) for column_index, value in enumerate(list(row))]
    for row_index, row
    in enumerate(ms)
]

candidate_mass_lists = [[mass] for mass in itertools.chain.from_iterable(mass_grid) if mass.value == 'a']

result_list = []
candidate_mass_list = []
while len(candidate_mass_lists) > 0:
    candidate_mass_list = candidate_mass_lists.pop(0)

    last_mass = candidate_mass_list[-1]
    if last_mass.value == 'z':
        result_list = candidate_mass_list
        break

    target_value = chr(ord(last_mass.value) + 1)

    around_last_masses = []
    if last_mass.row_index > 0:
        around_last_masses.append(mass_grid[last_mass.row_index - 1][last_mass.column_index])
    if last_mass.column_index > 0:
        around_last_masses.append(mass_grid[last_mass.row_index][last_mass.column_index - 1])
    if last_mass.column_index + 1 < len(mass_grid[last_mass.row_index]):
        around_last_masses.append(mass_grid[last_mass.row_index][last_mass.column_index + 1])
    if last_mass.row_index + 1 < len(mass_grid):
        around_last_masses.append(mass_grid[last_mass.row_index + 1][last_mass.column_index])

    candidate_mass_lists.extend(
        [*candidate_mass_list, mass]
        for mass
        in around_last_masses
        if mass.value == target_value
    )

result_grid = [['-'] * n for _ in range(n)]
for mass in result_list:
    result_grid[mass.row_index][mass.column_index] = mass.value

results = [''.join(row) for row in result_grid]

# print("answer")
for result in results:
    print(result)
