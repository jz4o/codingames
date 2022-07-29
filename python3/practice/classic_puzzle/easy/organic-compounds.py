# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
compounds = []
for i in range(n):
    compound = input()
    compounds.append(compound)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class Compound:
    def __init__(self, can_union):
        self.can_union = can_union


class Union:
    def __init__(self, require_size):
        self.require_size = require_size


compound_grid = []
for compound in compounds:
    compound_row = []
    for compound_elements in re.findall('.{3}', compound):
        if re.fullmatch(r'CH\d', compound_elements):
            inner_union = int(compound_elements[-1])
            compound_row.append(Compound(4 - inner_union))
        else:
            size = int(re.findall(r'\d', compound_elements)[0]) if compound_elements.replace(' ', '') != '' else 0
            compound_row.append(Union(size))

    compound_grid.append(compound_row)

compound_grid = [[Union(0), *compound_row, Union(0)] for compound_row in compound_grid]
compound_grid.insert(0, [Union(0)] * len(compound_grid[0]))
compound_grid.append([Union(0)] * len(compound_grid[0]))

max_width_count = max(map(len, compound_grid))
for compound_row in compound_grid:
    compound_row += [Union(0)] * (max_width_count - len(compound_row))

for row_index, row in enumerate(compound_grid):
    for compound_index, compound in enumerate(row):
        if not isinstance(compound, Compound):
            continue

        top_union = compound_grid[row_index - 1][compound_index]
        left_union = compound_grid[row_index][compound_index - 1]
        right_union = compound_grid[row_index][compound_index + 1]
        bottom_union = compound_grid[row_index + 1][compound_index]

        for union in [top_union, left_union, right_union, bottom_union]:
            if isinstance(union, Union):
                compound.can_union -= union.require_size

compound_instances = [compound for compound in sum(compound_grid, []) if isinstance(compound, Compound)]
result = 'VALID' if all([compound.can_union == 0 for compound in compound_instances]) else 'INVALID'

# print("answer")
print(result)
