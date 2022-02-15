import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
xthen_commands = input()
rthen_roadpatterns = []
for i in range(n):
    rthen_roadpattern = input()

    rthen_roadpatterns.append(rthen_roadpattern)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

position, *commands = xthen_commands.split(';')

position = int(position)
commands = sum([[command[-1]] * int(command[:-1]) for command in commands], [])

results = []
for index, rthen_roadpattern in enumerate(rthen_roadpatterns):
    count, pattern = rthen_roadpattern.split(';')

    for i in range(int(count)):
        command = commands.pop(0)

        if command == 'L':
            position -= 1
        elif command == 'R':
            position += 1

        output_pattern = pattern
        output_pattern = f'{output_pattern[:position-1]}#{output_pattern[position:]}'

        results.append(output_pattern)

# print("answer")
for result in results:
    print(result)
