# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.


class SpreadSheet:
    def __init__(self):
        self.cells = []

    def get_cell(self, index):
        return self.cells[index]

    def add_cell(self, cell):
        self.cells.append(cell)
        cell.spread_sheet = self


class Cell:
    def __init__(self, operation, arg1, arg2):
        self.operation = operation
        self.arg1 = arg1
        self.arg2 = arg2
        self.spread_sheet = None
        self.value = None

    def get_arg_value(self, arg):
        if '$' in arg:
            return self.spread_sheet.get_cell(int(arg[1:])).get_value()

        if arg == '_':
            return '0'

        return arg

    def get_value(self):
        return self.value if self.value is not None else self.calc_value()

    def calc_value(self):
        arg1 = int(self.get_arg_value(self.arg1))
        arg2 = int(self.get_arg_value(self.arg2))

        result = 0
        if self.operation == 'VALUE':
            result = arg1
        elif self.operation == 'ADD':
            result = arg1 + arg2
        elif self.operation == 'SUB':
            result = arg1 - arg2
        elif self.operation == 'MULT':
            result = arg1 * arg2

        self.value = str(result)

        return self.value


n = int(input())
spread_sheet = SpreadSheet()
for _ in range(n):
    operation, arg_1, arg_2 = input().split()

    spread_sheet.add_cell(Cell(operation, arg_1, arg_2))

for i in range(n):

    # Write an answer using print
    # To debug: print("Debug messages...", file=sys.stderr, flush=True)

    # print("1")
    print(spread_sheet.get_cell(i).get_value())
