# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

r = int(input())
c = int(input())
t = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class Cell:
    def __init__(self, y, x, value):
        self.y = y
        self.x = x
        self.value = value
        self.is_reachable = None


def check_reachable_cell(grid, target_y, target_x, threshold):
    target_cell = grid[target_y][target_x]

    if target_cell.is_reachable is not None:
        return target_cell.is_reachable

    accessible_value = target_cell.value <= threshold
    is_upper_left_cell = target_cell.y == 0 and target_cell.x == 0
    top_cell_is_reachable = False
    if target_cell.y != 0:
        top_cell_is_reachable = check_reachable_cell(grid, target_cell.y - 1, target_cell.x, threshold)
    left_cell_is_reachable = False
    if target_cell.x != 0:
        left_cell_is_reachable = check_reachable_cell(grid, target_cell.y, target_cell.x - 1, threshold)

    is_reachable_cell = is_upper_left_cell or top_cell_is_reachable or left_cell_is_reachable
    target_cell.is_reachable = accessible_value and is_reachable_cell

    return target_cell.is_reachable


sum_r_index_digits = [sum(map(int, str(index))) for index in range(r)]
sum_c_index_digits = [sum(map(int, str(index))) for index in range(c)]

grid = []
for row_index, row_sum in enumerate(sum_r_index_digits):
    row = []
    for column_index, column_sum in enumerate(sum_c_index_digits):
        row.append(Cell(row_index, column_index, row_sum + column_sum))
    grid.append(row)

bottom_right_cell = grid[-1][-1]
check_reachable_cell(grid, bottom_right_cell.y, bottom_right_cell.x, t)

result = len([cell for cell in sum(grid, []) if cell.is_reachable])

# print("answer")
print(result)
