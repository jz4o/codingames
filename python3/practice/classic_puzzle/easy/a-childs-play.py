import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w, h = [int(i) for i in input().split()]
n = int(input())
grid = []
for i in range(h):
    line = input()
    grid.append(list(line))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Robot:
    def __init__(self, y, x):
        self.directions = ['N', 'E', 'S', 'W']
        self.logs = []
        self.y = y
        self.x = x

    def place(self):
        return f'{self.x} {self.y}'

    def place_with_direction(self):
        return f'{self.place()} {self.direction()}'

    def direction(self):
        return self.directions[0]

    def forward(self):
        direction = self.direction()

        if direction == 'N':
            self.y -= 1
        elif direction == 'E':
            self.x += 1
        elif direction == 'S':
            self.y += 1
        elif direction == 'W':
            self.x -= 1

    def ahead_mass_index(self):
        direction = self.direction()

        if direction == 'N':
            return (self.y - 1, self.x)
        elif direction == 'E':
            return (self.y, self.x + 1)
        elif direction == 'S':
            return (self.y + 1, self.x)
        elif direction == 'W':
            return (self.y, self.x - 1)

    def turn_right(self):
        self.directions.append(self.directions.pop(0))

    def log(self):
        self.logs.append(self.place_with_direction())

    def is_logged_place(self):
        return self.place_with_direction() in self.logs

    def skiped_turn(self, n, turn):
        loop_begin_turn = self.logs.index(self.place_with_direction())
        loop_size = turn - loop_begin_turn

        return n - ((n - loop_begin_turn) % loop_size)


robot = None
for row_index, row in enumerate(grid):
    if 'O' not in row:
        continue

    robot = Robot(row_index, row.index('O'))
    break

turn = 0
while turn < n:
    turn += 1

    robot.log()

    robot.forward()
    while True:
        y, x = robot.ahead_mass_index()
        if y >= len(grid) or x >= len(grid[y]) or grid[y][x] != '#':
            break

        robot.turn_right()

    # omit to loop turn
    if robot.is_logged_place():
        turn = robot.skiped_turn(n, turn)

# print("answer")
print(robot.place())
