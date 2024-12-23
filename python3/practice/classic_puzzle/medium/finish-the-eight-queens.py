# import sys
# import math

import itertools

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

rows = []
for _ in range(8):
    row = input()
    rows.append(row)
# for i in range(8):
#
#     # Write an answer using print
#     # To debug: print("Debug messages...", file=sys.stderr, flush=True)
#
#     print("row")

class Board:
    class Cell:
        def __init__(self, row_index, column_index, value):
            self.row_index = row_index
            self.column_index = column_index
            self.value = value

    BOARD_SIZE = 8
    QUEEN = 'Q'

    def __init__(self, rows):
        self.grid = [
            [Board.Cell(row_index, column_index, value) for column_index, value in enumerate(row)]
            for row_index, row in enumerate(rows)
        ]
        self.candidate_cells = list(itertools.chain.from_iterable(self.grid))

        self.queen_count = 0
        queen_cells = [cell for cell in self.candidate_cells if cell.value == Board.QUEEN]
        for queen_cell in queen_cells:
            self.fill_cell(queen_cell)

    def fill(self):
        is_filled = False
        for index in range(Board.BOARD_SIZE):
            row_candidate_cells = [cell for cell in self.candidate_cells if cell.row_index == index]
            if len(row_candidate_cells) == 1:
                self.fill_cell(row_candidate_cells.pop())
                is_filled = True

            column_candidate_cells = [cell for cell in self.candidate_cells if cell.column_index == index]
            if len(column_candidate_cells) == 1:
                self.fill_cell(column_candidate_cells.pop())
                is_filled = True

        return is_filled

    def fill_cell(self, cell):
        self.grid[cell.row_index][cell.column_index].value = Board.QUEEN
        self.queen_count += 1

        self._remove_candidate_cells(cell)

    def get_candidate_challenge_fill_cells(self):
        candidates = []
        for index in range(Board.BOARD_SIZE):
            candidates.extend([
                [cell for cell in self.candidate_cells if cell.row_index == index],
                [cell for cell in self.candidate_cells if cell.column_index == index],
            ])
        candidates = [candidate for candidate in candidates if len(candidate) > 0]

        if len(candidates) == 0:
            return []

        return next(iter(sorted(candidates, key=len)))

    def is_finished(self):
        return self.queen_count == Board.BOARD_SIZE

    def get_row_values(self):
        return [
            ''.join([cell.value for cell in row])
            for row in self.grid
        ]

    def _remove_candidate_cells(self, queen_cell):
        self.candidate_cells = [
            candidate_cell
            for candidate_cell in self.candidate_cells
            if (
                candidate_cell.row_index != queen_cell.row_index
                and candidate_cell.column_index != queen_cell.column_index
                and (
                    abs(candidate_cell.row_index - queen_cell.row_index)
                    != abs(candidate_cell.column_index - queen_cell.column_index)
                )
            )
        ]

boards = [Board(rows)]
finished_board = None
while len(boards) > 0:
    board = boards.pop(0)

    while board.fill():
        pass

    if board.is_finished():
        finished_board = board
        break

    candidate_cells = board.get_candidate_challenge_fill_cells()
    board_row_values = board.get_row_values()
    for cell in candidate_cells:
        new_board = Board(board_row_values)
        new_board.fill_cell(cell)

        boards.append(new_board)

if finished_board is None:
    raise RuntimeError("can't solution")

results = finished_board.get_row_values()

for result in results:
    print(result)
