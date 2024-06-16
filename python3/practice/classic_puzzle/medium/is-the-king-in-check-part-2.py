# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chess_board = []
for _ in range(8):
    chess_row = input()
    chess_board.append(chess_row.split())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class Piece:
    def __init__(self, kind, row, column):
        self.kind = kind
        self.row = row
        self.column = column


enemy_kinds = ['B', 'N', 'R', 'Q']

king = Piece('k', -1, -1)  # dummy king
enemies = []
for row_index, row in enumerate(chess_board):
    for column_index, kind in enumerate(row):
        if kind == 'k':
            king = Piece(kind, row_index, column_index)
        if kind in enemy_kinds:
            enemies.append(Piece(kind, row_index, column_index))

is_check = False
for enemy, another_enemy in zip(enemies, reversed(enemies)):
    is_same_row = king.row == enemy.row
    is_same_column = king.column == enemy.column
    is_same_diagonal_line = abs(king.row - enemy.row) == abs(king.column - enemy.column)

    is_same_row_another_enemy = king.row == another_enemy.row
    is_same_column_another_enemy = king.column == another_enemy.column
    is_same_diagonal_line_another_enemy = abs(king.row - another_enemy.row) == abs(king.column - another_enemy.column)

    range_row_king_and_enemy = range(min(king.row, enemy.row), max(king.row, enemy.row) + 1)
    range_column_king_and_enemy = range(min(king.column, enemy.column), max(king.column, enemy.column) + 1)

    is_block_by_another_enemy_in_row = (
        is_same_row_another_enemy
        and another_enemy.column in range_column_king_and_enemy
    )
    is_block_by_another_enemy_in_column = (
        is_same_column_another_enemy
        and another_enemy.row in range_row_king_and_enemy
    )
    is_block_by_another_enemy_in_diagonal_line = (
        is_same_diagonal_line_another_enemy
        and another_enemy.row in range_row_king_and_enemy
        and another_enemy.column in range_column_king_and_enemy
    )

    is_check_row = is_same_row and not is_block_by_another_enemy_in_row
    is_check_column = is_same_column and not is_block_by_another_enemy_in_column
    is_check_diagonal_line = is_same_diagonal_line and not is_block_by_another_enemy_in_diagonal_line

    if enemy.kind == 'B':
        is_check = is_check_diagonal_line
    elif enemy.kind == 'N':
        is_check = (
            not is_same_row
            and not is_same_column
            and abs(king.row - enemy.row) + abs(king.column - enemy.column) == 3
        )
    elif enemy.kind == 'R':
        is_check = is_check_row or is_check_column
    elif enemy.kind == 'Q':
        is_check = is_check_row or is_check_column or is_check_diagonal_line

    if is_check:
        break

# print("Check/No Check")
print('Check' if is_check else 'No Check')
