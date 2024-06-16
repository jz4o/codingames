# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chess_board = []
for _ in range(8):
    chess_row = input()

    chess_board.append(chess_row.split(' '))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class Piece:
    def __init__(self, kind, row, column):
        self.kind = kind
        self.row = row
        self.column = column


enemy_kinds = ['B', 'N', 'R', 'Q']

king = None
enemy = None
for row_index, row in enumerate(chess_board):
    for column_index, kind in enumerate(row):
        if kind == 'K':
            king = Piece(kind, row_index, column_index)
        if kind in enemy_kinds:
            enemy = Piece(kind, row_index, column_index)

is_same_row = king.row == enemy.row
is_same_column = king.column == enemy.column
is_same_diagonal_line = abs(king.row - enemy.row) == abs(king.column - enemy.column)
result = None
if enemy.kind == 'B':
    result = is_same_diagonal_line
elif enemy.kind == 'N':
    result = not is_same_row and not is_same_column and abs(king.row - enemy.row) + abs(king.column - enemy.column) == 3
elif enemy.kind == 'R':
    result = is_same_row or is_same_column
elif enemy.kind == 'Q':
    result = is_same_row or is_same_column or is_same_diagonal_line

# print("Check/No Check")
print('Check' if result else 'No Check')
