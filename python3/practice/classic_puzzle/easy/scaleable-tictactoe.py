# import sys
# import math

import copy
import itertools

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n, g = [int(i) for i in input().split()]
rows = []
for _ in range(n):
    row = input()
    rows.append(row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class TicTacToe:
    class Cell:
        def __init__(self, row_index, column_index, value):
            self.row_index = row_index
            self.column_index = column_index
            self.value = value

    class JudgeResult:
        def __init__(self, message, grid):
            self.message = message
            self.grid = grid

    PLAYER_MARKS = ['X', 'O']
    EMPTY = ' '

    def __init__(self, rows, g):
        self.grid = [
            [
                TicTacToe.Cell(row_index, column_index, value)
                for column_index, value
                in enumerate(row)
            ]
            for row_index, row
            in enumerate(rows)
        ]
        self.size = len(rows)
        self.g = g

    def judge(self):
        dup_grid = copy.deepcopy(self.grid)

        check_methods = [
            self.__check_rows,
            self.__check_columns,
            self.__check_diagonal_left_bottom_to_right_top,
            self.__check_diagonal_left_top_to_right_bottom,
        ]
        for check_method in check_methods:
            result = check_method(dup_grid)
            if result is not None:
                return result

        is_filled = all(
            cell.value != TicTacToe.EMPTY
            for cell
            in itertools.chain.from_iterable(self.grid)
        )

        result_message = 'The game {}'.format('ended in a draw!' if is_filled else "isn't over yet!")
        result_grid = [
            [cell.value for cell in row]
            for row
            in dup_grid
        ]

        return TicTacToe.JudgeResult(result_message, result_grid)

    def __check_rows(self, grid):
        for row in grid:
            row_values = [cell.value for cell in row]

            for mark in TicTacToe.PLAYER_MARKS:
                if (mark * self.g) not in ''.join(row_values):
                    continue

                for index, value in enumerate(''.join(row_values).replace(mark * self.g, '-' * self.g, 1)):
                    row[index].value = value

                result_grid = [
                    [cell.value for cell in row]
                    for row
                    in grid
                ]

                return TicTacToe.JudgeResult(f'The winner is {mark}.', result_grid)

        return None

    def __check_columns(self, grid):
        transposed_grid = pd.DataFrame(grid).T.to_numpy()
        for column in transposed_grid:
            column_values = [cell.value for cell in column]

            for mark in TicTacToe.PLAYER_MARKS:
                if (mark * self.g) not in ''.join(column_values):
                    continue

                for index, value in enumerate(''.join(column_values).replace(mark * self.g, '|' * self.g, 1)):
                    column[index].value = value

                result_grid = [
                    [cell.value for cell in row]
                    for row in pd.DataFrame(transposed_grid).T.to_numpy()
                ]

                return TicTacToe.JudgeResult(f'The winner is {mark}.', result_grid)

        return None

    def __check_diagonal_left_bottom_to_right_top(self, grid):
        for index_value in range((self.size - 1) * 2 + 1):
            diagonal_cells = sorted(
                [
                    cell
                    for cell
                    in itertools.chain.from_iterable(grid)
                    if cell.row_index + cell.column_index == index_value
                ],
                key= lambda cell: cell.row_index,
            )
            diagonal_values = [cell.value for cell in diagonal_cells]

            for mark in TicTacToe.PLAYER_MARKS:
                if (mark * self.g) not in ''.join(diagonal_values):
                    continue

                for index, value in enumerate(''.join(diagonal_values).replace(mark * self.g, '/' * self.g, 1)):
                    diagonal_cells[index].value = value

                result_grid = [
                    [cell.value for cell in row]
                    for row
                    in grid
                ]

                return TicTacToe.JudgeResult(f'The winner is {mark}.', result_grid)

        return None

    def __check_diagonal_left_top_to_right_bottom(self, grid):
        for index_value in range(-(self.size - 1), self.size):
            diagonal_cells = sorted(
                [
                    cell
                    for cell
                    in itertools.chain.from_iterable(grid)
                    if cell.row_index - cell.column_index == index_value
                ],
                key=lambda cell: cell.row_index,
            )
            diagonal_values = [
                cell.value
                for cell
                in diagonal_cells
            ]

            for mark in TicTacToe.PLAYER_MARKS:
                if (mark * self.g) not in ''.join(diagonal_values):
                    continue

                for index, value in enumerate(''.join(diagonal_values).replace(mark * self.g, '\\' * self.g)):
                    diagonal_cells[index].value = value

                result_grid = [
                    [cell.value for cell in row]
                    for row
                    in grid
                ]

                return TicTacToe.JudgeResult(f'The winner is {mark}.', result_grid)

        return None

tictactoe =TicTacToe(rows, g)
tictactoe_result = tictactoe.judge()

results = [
    *[''.join(row) for row in tictactoe_result.grid],
    tictactoe_result.message,
]

# print("Answer")
for result in results:
    print(result)
