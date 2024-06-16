# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

rook_position = input()
nb_pieces = int(input())
piece_rows = []
for _ in range(nb_pieces):
    inputs = input().split()
    colour = int(inputs[0])
    one_piece = inputs[1]

    piece_rows.append([colour, one_piece])

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

BLACK = 1

piece_positions = {}
for colour, one_piece in piece_rows:
    column, row = list(one_piece)
    row = int(row)

    if column not in piece_positions:
        piece_positions[column] = {}
    piece_positions[column][row] = colour

rook_column, rook_row = list(rook_position)
rook_row = int(rook_row)

results = []

# move to top
for row_num in reversed(range(1, rook_row)):
    if rook_column in piece_positions and row_num in piece_positions[rook_column]:
        colour = piece_positions[rook_column][row_num]
        if colour == BLACK:
            results.append(f'R{rook_position}x{rook_column}{row_num}')
        break

    results.append(f'R{rook_position}-{rook_column}{row_num}')

# move to bottom
for row_num in range(rook_row + 1, 8 + 1):
    if rook_column in piece_positions and row_num in piece_positions[rook_column]:
        colour = piece_positions[rook_column][row_num]
        if colour == BLACK:
            results.append(f'R{rook_position}x{rook_column}{row_num}')
        break

    results.append(f'R{rook_position}-{rook_column}{row_num}')

# move to left
for column in reversed('abcdefgh'):
    if ord(rook_column) <= ord(column):
        continue

    if column in piece_positions and rook_row in piece_positions[column]:
        colour = piece_positions[column][rook_row]
        if colour == BLACK:
            results.append(f'R{rook_position}x{column}{rook_row}')
        break

    results.append(f'R{rook_position}-{column}{rook_row}')

# move to right
for column in 'abcdefgh':
    if ord(column) <= ord(rook_column):
        continue

    if column in piece_positions and rook_row in piece_positions[column]:
        colour = piece_positions[column][rook_row]
        if colour == BLACK:
            results.append(f'R{rook_position}x{column}{rook_row}')
        break

    results.append(f'R{rook_position}-{column}{rook_row}')

results = sorted(results)

# print("ANSWER")
for result in results:
    print(result)
