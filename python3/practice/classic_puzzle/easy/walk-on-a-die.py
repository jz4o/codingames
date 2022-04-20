import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

lines = []
for i in range(3):
    line = input()  # One line out of three in the string describing the starting position.
    lines.append(line)
commands = input()  # The sequence of ULDR-characters describing the steps to perform.

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Dice:
    def __init__(self, numbers_string):
        self.front, self.left, self.on, self.right, self.opposite, self.behind = list(numbers_string)

    def move(self, commands):
        command_to_method = {
            'U': self.move_to_forward,
            'D': self.move_to_backward,
            'L': self.move_to_left,
            'R': self.move_to_right
        }

        for command in commands:
            command_to_method[command]()

    def move_to_forward(self):
        self.front, self.on, self.opposite, self.behind = self.opposite, self.front, self.behind, self.on

    def move_to_backward(self):
        self.front, self.left, self.on, self.right, self.opposite, self.behind = self.opposite, self.right, self.behind, self.left, self.front, self.on

    def move_to_left(self):
        self.front, self.left, self.on, self.right, self.opposite, self.behind = self.opposite, self.behind, self.left, self.front, self.right, self.on

    def move_to_right(self):
        self.front, self.left, self.on, self.right, self.opposite, self.behind = self.opposite, self.front, self.right, self.behind, self.left, self.on


dice = Dice(''.join(lines).replace(' ', ''))
dice.move(commands)

result = dice.on

# The number on the side you end up on after having performed `commands`.
# print("number")
print(result)
