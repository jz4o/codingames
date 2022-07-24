# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
m = int(input())
input_signals = {}
for i in range(n):
    input_name, input_signal = input().split()
    input_signals[input_name] = input_signal
output_lines = []
for i in range(m):
    output_name, _type, input_name_1, input_name_2 = input().split()
    output_lines.append([output_name, _type, input_name_1, input_name_2])
for i in range(m):

    # Write an answer using print
    # To debug: print("Debug messages...", file=sys.stderr, flush=True)

    output_name, _type, input_name_1, input_name_2 = output_lines.pop(0)

    input_signal_1 = input_signals[input_name_1]
    input_signal_2 = input_signals[input_name_2]

    signal_chars = zip(input_signal_1, input_signal_2)

    output = ''
    if _type == 'AND':
        for chars in signal_chars:
            output += '-' if all([c == '-' for c in chars]) else '_'
    elif _type == 'OR':
        for chars in signal_chars:
            output += '-' if '-' in chars else '_'
    elif _type == 'XOR':
        for l, r in signal_chars:
            output += '-' if l != r else '_'
    elif _type == 'NAND':
        for chars in signal_chars:
            output += '_' if all([c == '-' for c in chars]) else '-'
    elif _type == 'NOR':
        for chars in signal_chars:
            output += '_' if '-' in chars else '-'
    elif _type == 'NXOR':
        for l, r in signal_chars:
            output += '_' if l != r else '-'

    result = f'{output_name} {output}'

    # print("output name and signal")
    print(result)
