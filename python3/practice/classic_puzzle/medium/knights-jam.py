# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

lines = []
for _ in range(3):
    line = input()
    lines.append(line)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class SmallestMovesCountCalculator:
    @classmethod
    def calc(cls, grid):
        center_value = grid[1][1]
        if center_value != '5':
            return -1

        clockwise_values = cls._get_clockwise_values_from_right_bottom(grid)
        empty_index = clockwise_values.index('.')
        del clockwise_values[empty_index]

        ordered_grid = [
            ['1', '2', '3'],
            ['4', '5', '6'],
            ['7', '8', '.'],
        ]
        clockwise_ordered_values = cls._get_clockwise_values_from_right_bottom(ordered_grid)
        double_clockwise_ordered_values = ''.join(clockwise_ordered_values * 2).replace('.', '')

        if ''.join(clockwise_values) not in double_clockwise_ordered_values:
            return -1

        second_number_clockwise_ordered_values = clockwise_ordered_values[1]
        second_number_index = clockwise_values.index(second_number_clockwise_ordered_values)

        return min(
            abs((second_number_index * (len(clockwise_values) + 1)) - empty_index),
            ((len(clockwise_values) - second_number_index) * (len(clockwise_values) + 1)) + empty_index,
        )

    @staticmethod
    def _get_clockwise_values_from_right_bottom(grid):
        return [
            grid[2][2],
            grid[1][0],
            grid[0][2],
            grid[2][1],
            grid[0][0],
            grid[1][2],
            grid[2][0],
            grid[0][1],
        ]

grid = [list(line) for line in lines]

result = SmallestMovesCountCalculator.calc(grid)

# print("-1")
print(result)
