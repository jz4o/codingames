# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

height, width = (int(i) for i in input().split())
lines1 = []
for _ in range(height):
    line = input()
    lines1.append(line)
lines2 = []
for _ in range(height):
    line = input()
    lines2.append(line)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

lines1_numbers = map(int, ' '.join(lines1).split())
lines2_marks = ' '.join(lines2).split()

x_numbers = [number for number, mark in zip(lines1_numbers, lines2_marks, strict=True) if mark == 'X']
x_positive_booleans = [x_number > 0 for x_number in x_numbers]

result = all(x_positive_booleans[i] is not x_positive_booleans[i + 1] for i in range(len(x_positive_booleans) - 1))
result = str(result).lower()

# print("true/false")
print(result)
