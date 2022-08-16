# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
lines = []
for i in range(n):
    line = input()
    lines.append(line)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class Stack:
    def __init__(self, upper_most):
        self.upper_most = upper_most


results = []
for line in lines:
    stacks = []
    containers = [ord(char) for char in line]
    while len(containers) > 0:
        container = containers.pop(0)

        putable_stacks = [stack for stack in stacks if container <= stack.upper_most]

        if len(putable_stacks) > 0:
            sorted(putable_stacks, key=lambda stack: stack.upper_most)[0].upper_most = container
        else:
            stacks.append(Stack(container))

    results.append(len(stacks))

# print("answer")
for result in results:
    print(result)
