import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

a, b, c, d = [int(i) for i in input().split()]
n = int(input())
instructions = []
for i in range(n):
    instruction = input()

    instructions.append(instruction)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

register = {'a': a, 'b': b, 'c': c, 'd': d}

index = 0
while index < len(instructions):
    operator, *args = [e for e in instructions[index].split()]

    args[1] = register[args[1]] if args[1] in 'abcd' else int(args[1])
    if len(args) >= 3:
        args[2] = register[args[2]] if args[2] in 'abcd' else int(args[2])

    if operator == 'MOV':
        register[args[0]] = args[1]
    elif operator == 'ADD':
        register[args[0]] = args[1] + args[2]
    elif operator == 'SUB':
        register[args[0]] = args[1] - args[2]
    elif operator == 'JNE':
        if args[1] != args[2]:
            index = int(args[0])
            continue

    index += 1

result = ' '.join([str(register[i]) for i in 'abcd'])

# print("a b c d")
print(result)
