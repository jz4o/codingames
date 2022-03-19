import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
lines = []
for i in range(n):
    line = input()
    lines.append(line)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class IndentCombination:
    def __init__(self, indent, combination):
        self.indent = indent
        self.combination = combination


lines = [line for line in lines if line in ['if', 'else', 'endif']]

indent = 0
stack = []
for line in reversed(lines):
    if line == 'if':
        value = 1
        while len(stack) > 0 and stack[-1].indent == indent:
            value *= stack.pop().combination

        value += stack.pop().combination

        indent -= 1

        stack.append(IndentCombination(indent, value))
    if line == 'else':
        value = 1
        while len(stack) > 0 and stack[-1].indent == indent:
            value *= stack.pop().combination

        stack.append(IndentCombination(indent - 1, value))
    if line == 'endif':
        indent += 1

result = 1
for indent_combination in stack:
    result *= indent_combination.combination

# print("answer")
print(result)
