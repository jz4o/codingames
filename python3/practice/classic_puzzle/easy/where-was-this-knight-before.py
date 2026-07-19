# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

pieces = input()
before_lines = []
for _ in range(8):
    sline = input()
    before_lines.append(sline)
after_lines = []
for _ in range(8):
    eline = input()
    after_lines.append(eline)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Cell:
    y: int
    x: int
    v: str
    lv: str

    def __init__(self, y, x, v):
        self.y = y
        self.x = x
        self.v = v
        self.lv = v.lower()

    def coordinates(self):
        row = 8 - self.y
        column = 'abcdefgh'[self.x]

        return f'{column}{row}'

lower_pieces = pieces.lower()

diff_before_cells = []
diff_after_cells = []
for line_index, line in enumerate(before_lines):
    for column_index, before_value in enumerate(line):
        after_value = after_lines[line_index][column_index]
        if before_value == after_value:
            continue
        if all(v.lower() not in lower_pieces for v in [before_value, after_value]):
            continue

        diff_before_cells.append(Cell(line_index, column_index, before_value))
        diff_after_cells.append(Cell(line_index, column_index, after_value))
is_simple_move = len([cell for cell in [*diff_before_cells, *diff_after_cells] if cell.lv in lower_pieces]) == 2

move_before_cell = None
move_after_cell = None
if is_simple_move:
    move_before_cell = next(iter(cell for cell in diff_before_cells if cell.lv in lower_pieces))
    move_after_cell = next(iter(cell for cell in diff_after_cells if cell.v == move_before_cell.v))
else:
    move_after_cell = next(iter(cell for cell in diff_after_cells if cell.lv in lower_pieces))
    move_before_cell = next(iter(cell for cell in diff_before_cells if cell.v == move_after_cell.v))

move_y = abs(move_before_cell.y - move_after_cell.y)
move_x = abs(move_before_cell.x - move_after_cell.x)
is_knight = sorted([move_y, move_x]) == [1, 2]

results = []
results.append(''.join([move_before_cell.coordinates(), '-' if is_simple_move else 'x', move_after_cell.coordinates()]))
results.append('Knight' if is_knight else 'Other')

# print("answer")
for result in results:
    print(result)
