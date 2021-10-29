import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

level = int(input())
xp = int(input())
n = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class BlitzProg:
    def __init__(self, level, exp_to_level_up):
        self.level = level
        self.exp_to_level_up = exp_to_level_up

def reflect_exp(current_level, exp, level_up_exp):
    temp_exp = exp
    if level_up_exp >= 0:
        temp_exp -= level_up_exp
    else:
        temp_exp -= get_exp_for_level_up(current_level)

    if temp_exp < 0:
        return BlitzProg(current_level, temp_exp * -1)
    else:
        return reflect_exp(current_level + 1, temp_exp, -1)

def get_exp_for_level_up(current_level):
    return int(current_level * math.sqrt(current_level) * 10)


exp_of_puzzle = 300

blitz_prog = reflect_exp(level, exp_of_puzzle * n, xp)

# print("answer")
print(blitz_prog.level)
print(blitz_prog.exp_to_level_up)
