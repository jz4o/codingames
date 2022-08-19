# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


def is_prime(num):
    if num < 2:
        return False

    i = 2
    while i < num:
        if num % i == 0:
            return False

        i += 1

    return True


top_rows = []
bottom_rows = []

for i in range(1, n + 1, 2):
    top_row_right_value = i**2 + i + 2
    top_row_left_value = top_row_right_value + i - 1
    top_row = list(reversed(range(top_row_right_value, top_row_left_value + 1)))

    bottom_row_right_value = i**2
    bottom_row_left_value = bottom_row_right_value - i + 1
    bottom_row = list(range(bottom_row_left_value, bottom_row_right_value + 1))

    for j in range(1, ((n - i) // 2) + 1):
        inner_square_last_value = (i + (j - 1) * 2)**2
        outer_square_last_value = (i + (j * 2))**2

        bottom_row_left_value = outer_square_last_value - i - j * 3 + 1
        bottom_row_right_value = inner_square_last_value + j

        top_row_left_value = bottom_row_left_value - i
        top_row_right_value = bottom_row_right_value + i

        top_row.append(top_row_right_value)
        top_row.insert(0, top_row_left_value)

        bottom_row.append(bottom_row_right_value)
        bottom_row.insert(0, bottom_row_left_value)

    top_rows.insert(0, top_row)
    bottom_rows.append(bottom_row)

# remove trash row
top_rows.pop(0)

number_grid = top_rows + bottom_rows

results = []
for number_row in number_grid:
    results.append(' '.join(['#' if is_prime(number) else ' ' for number in number_row]))

# print("ROW")
for result in results:
    print(result)
