import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

class Cell:
    def __init__(self, operation, arg1, arg2, value):
        self.operation = operation
        self.arg1 = arg1
        self.arg2 = arg2
        self.value = value


def get_cell_value(cells, index):
    value = cells[index].value
    return value if value is not None else calc(cells, index)


def get_arg_value(cells, arg):
    if '$' in arg:
        return get_cell_value(cells, int(arg[1:]))
    elif arg == '_':
        return '0'
    else:
        return arg


def calc(cells, index):
    cell = cells[index]
    arg1 = int(get_arg_value(cells, cell.arg1))
    arg2 = int(get_arg_value(cells, cell.arg2))

    result = 0
    if cell.operation == 'VALUE':
        result = arg1
    elif cell.operation == 'ADD':
        result = arg1 + arg2
    elif cell.operation == 'SUB':
        result = arg1 - arg2
    elif cell.operation == 'MULT':
        result = arg1 * arg2

    cells[index].value = str(result)

    return cells[index].value


n = int(input())
cells = []
for i in range(n):
    operation, arg_1, arg_2 = input().split()

    cells.append(Cell(operation, arg_1, arg_2, None))

for i in range(n):

    # Write an answer using print
    # To debug: print("Debug messages...", file=sys.stderr, flush=True)

    # print("1")
    print(get_cell_value(cells, i))
