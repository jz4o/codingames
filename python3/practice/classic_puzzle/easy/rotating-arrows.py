# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w, h = [int(i) for i in input().split()]
x, y = [int(i) for i in input().split()]
lines = []
for i in range(h):
    line = input()  # The line of w arrows represented by ascii char ^v<>
    lines.append(line)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class Position:
    ARROWS = ['^', '>', 'v', '<']

    def __init__(self, y, x, value):
        self.y = y
        self.x = x
        self.value = value

    def arrow_position(self):
        if self.value == '^':
            return [self.y - 1, self.x]
        elif self.value == '>':
            return [self.y, self.x + 1]
        elif self.value == 'v':
            return [self.y + 1, self.x]
        elif self.value == '<':
            return [self.y, self.x - 1]

    def rotate_arrow(self):
        self.value = __class__.ARROWS[(__class__.ARROWS.index(self.value) + 1) % len(__class__.ARROWS)]

    def is_equal_position(self, y, x):
        return self.y == y and self.x == x

    def is_overflow(self):
        return self.value == 'X'


lines = [f'X{line}X' for line in lines]
lines.insert(0, 'X' * (w + 2))
lines.append('X' * (w + 2))

grid = []
for line_index, line in enumerate(lines):
    row = []
    for char_index, char in enumerate(line):
        row.append(Position(line_index, char_index, char))

    grid.append(row)

x += 1
y += 1

current_position = grid[y][x]
result = 0

while True:
    current_position.rotate_arrow()
    arrow_y, arrow_x = current_position.arrow_position()

    current_position = grid[arrow_y][arrow_x]
    result += 1

    if current_position.is_equal_position(y, x) or current_position.is_overflow():
        break

# print("0")
print(result)
