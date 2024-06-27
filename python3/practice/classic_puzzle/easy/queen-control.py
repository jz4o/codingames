# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

color = input()
lines = []
for _ in range(8):
    line = input()
    lines.append(line)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

EMPTY = '.'
QUEEN = 'Q'

def count_controlled_square(board, queen_y, queen_x, queen_color):
    height = len(board)
    width = len(next(iter(board)))

    bottom_square_size = height - queen_y - 1
    right_square_size = width - queen_x - 1

    top_squares = [board[i][queen_x] for i in reversed(range(queen_y))]
    top_right_squares = [board[queen_y - i][queen_x + i] for i in range(1, min(queen_y, right_square_size) + 1)]
    right_squares = board[queen_y][queen_x + 1:]
    bottom_right_square_size = min(bottom_square_size, right_square_size)
    bottom_right_squares = [board[queen_y + i][queen_x + i] for i in range(1, bottom_right_square_size + 1)]
    bottom_squares = [row[queen_x] for row in board[queen_y + 1:]]
    bottom_left_squares = [board[queen_y + i][queen_x - i] for i in range(1, min(bottom_square_size, queen_x) + 1)]
    left_squares = list(reversed(board[queen_y][:queen_x]))
    top_left_squares = [board[queen_y - i][queen_x - i] for i in range(1, min(queen_y, queen_x) + 1)]

    square_lines = [
        top_squares,
        top_right_squares,
        right_squares,
        bottom_right_squares,
        bottom_squares,
        bottom_left_squares,
        left_squares,
        top_left_squares,
    ]

    return sum(count_line_controlled_square(square_line, queen_color) for square_line in square_lines)

def count_line_controlled_square(squares, queen_color):
    piece_index = next(iter([index for index, square in enumerate(squares) if square != EMPTY]))

    return piece_index + (0 if squares[piece_index] == queen_color else 1)

c = color[0]

board = [list(f'{c}{line}{c}') for line in lines]
board.insert(0, [c] * 10)
board.append([c] * 10)

queen_y = next(iter([index for index, row in enumerate(board) if QUEEN in row]))
queen_x = board[queen_y].index(QUEEN)

result = count_controlled_square(board, queen_y, queen_x, c)

# print("answer")
print(result)
