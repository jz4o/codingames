# import sys
# import math

import itertools
from collections import defaultdict

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

_max, cycles = (int(i) for i in input().split())
rows = []
for _ in range(cycles):
    inputs = input().split()
    name = inputs[0]
    initial_count = int(inputs[1])
    power = int(inputs[2])

    rows.append([name, initial_count, power])

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class Cell:
    def __init__(self, name, territory_count, power, index):
        self.name = name
        self.territory_count = territory_count
        self.power = power
        self.index = index


power_cell_dict = defaultdict(list)
for cycle_index in range(cycles):
    all_cells = list(itertools.chain.from_iterable(power_cell_dict.values()))

    remain = _max - sum([cell.territory_count for cell in all_cells])
    is_conflict_territory = remain == 0

    if is_conflict_territory:
        power_cells = power_cell_dict[max(power_cell_dict.keys())]

        for power_cell in power_cells:
            robbery_count = power_cell.territory_count // 10

            robbery_cell = None
            for cell in sorted(all_cells, key=lambda cell: (cell.power, cell.territory_count)):
                if cell.power < power_cell.power and robbery_count <= cell.territory_count:
                    robbery_cell = cell
                    break

            if robbery_cell is None:
                continue

            power_cell.territory_count += robbery_count
            robbery_cell.territory_count -= robbery_count
    else:
        for power in sorted(power_cell_dict.keys(), reverse=True):
            power_cells = power_cell_dict[power]

            sum_count_power_cells = sum([cell.territory_count for cell in power_cells])
            if remain < sum_count_power_cells:
                for power_cell in power_cells:
                    power_cell.territory_count += remain // len(power_cells)
                remain = 0
            elif sum_count_power_cells <= remain:
                for power_cell in power_cells:
                    remain -= power_cell.territory_count
                    power_cell.territory_count *= 2

    name, initial_count, power = rows[cycle_index]

    if name == 'STOP!':
        break

    cell = Cell(name, initial_count, power, cycle_index)
    power_cell_dict[cell.power].append(cell)

all_cells = list(itertools.chain.from_iterable(power_cell_dict.values()))
cells = [cell for cell in sorted(all_cells, key=lambda cell: cell.index) if cell.territory_count > 0]
sum_territory_count = sum([cell.territory_count for cell in cells])

results = []

if _max < sum_territory_count:
    results.append('OVERFLOW!')
if sum_territory_count < _max:
    results.append(f'EMPTY: {_max - sum_territory_count}')
if sum_territory_count <= _max:
    results.extend([f'{cell.name}: {cell.territory_count}' for cell in cells])

# print("The Answer: 42")
for result in results:
    print(result)
