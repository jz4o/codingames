# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

lines = []
for _ in range(3):
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
            'R': self.move_to_right,
        }

        for command in commands:
            command_to_method[command]()

    def move_to_forward(self):
        temp_opposite = self.opposite
        temp_front = self.front
        temp_behind = self.behind
        temp_on = self.on

        self.front = temp_opposite
        self.on = temp_front
        self.opposite = temp_behind
        self.behind = temp_on

    def move_to_backward(self):
        temp_opposite = self.opposite
        temp_right = self.right
        temp_behind = self.behind
        temp_left = self.left
        temp_front = self.front
        temp_on = self.on

        self.front = temp_opposite
        self.left = temp_right
        self.on = temp_behind
        self.right = temp_left
        self.opposite = temp_front
        self.behind = temp_on

    def move_to_left(self):
        temp_opposite = self.opposite
        temp_behind = self.behind
        temp_left = self.left
        temp_front = self.front
        temp_right = self.right
        temp_on = self.on

        self.front = temp_opposite
        self.left = temp_behind
        self.on = temp_left
        self.right = temp_front
        self.opposite = temp_right
        self.behind = temp_on

    def move_to_right(self):
        temp_opposite = self.opposite
        temp_front = self.front
        temp_right = self.right
        temp_behind = self.behind
        temp_left = self.left
        temp_on = self.on

        self.front = temp_opposite
        self.left = temp_front
        self.on = temp_right
        self.right = temp_behind
        self.opposite = temp_left
        self.behind = temp_on


dice = Dice(''.join(lines).replace(' ', ''))
dice.move(commands)

result = dice.on

# The number on the side you end up on after having performed `commands`.
# print("number")
print(result)
