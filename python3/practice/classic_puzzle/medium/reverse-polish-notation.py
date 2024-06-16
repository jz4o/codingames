# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
instructions = input().split()


# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

stack = []
try:
    for instruction in instructions:
        if instruction == 'ADD':
            r = int(stack.pop())
            l = int(stack.pop())
            stack.append(l + r)

        elif instruction == 'SUB':
            r = int(stack.pop())
            l = int(stack.pop())
            stack.append(l - r)

        elif instruction == 'MUL':
            r = int(stack.pop())
            l = int(stack.pop())
            stack.append(l * r)

        elif instruction == 'DIV':
            r = int(stack.pop())
            l = int(stack.pop())
            stack.append(int(l / r))

        elif instruction == 'MOD':
            r = int(stack.pop())
            l = int(stack.pop())
            stack.append(l % r)

        elif instruction == 'POP':
            stack.pop()

        elif instruction == 'DUP':
            last = stack.pop()
            stack += [last, last]

        elif instruction == 'SWP':
            r = stack.pop()
            l = stack.pop()
            stack += [r, l]

        elif instruction == 'ROL':
            last = int(stack.pop())
            stack.append(stack.pop(-last))

        else:
            stack.append(instruction)

except (ZeroDivisionError, IndexError):
    stack.append('ERROR')

result = ' '.join(str(i) for i in stack)

# print("answer")
print(result)
