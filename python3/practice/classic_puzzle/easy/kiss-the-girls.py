import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

h, w = [int(i) for i in input().split()]
lines = []
for i in range(h):
    line = input()
    lines.append(line)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Girl:
    def __init__(self, y, x, probability):
        self.y = y
        self.x = x
        self.probability = probability


girls = []
for line_index, line in enumerate(lines):
    for char_index, char in enumerate(line):
        if char != 'G':
            continue

        probability = min(line_index, char_index) / (line_index**2 + char_index**2 + 1)
        girls.append(Girl(line_index, char_index, probability))

girls = sorted(girls, key=lambda girl: girl.probability)

not_catching_probability = 1
CATCHING_BORDER= 0.6

girl_count = 0
while len(girls) > 0:
    girl = girls.pop(0)

    not_catching_probability *= (1 - girl.probability)
    if not_catching_probability < CATCHING_BORDER:
        break

    girl_count += 1

result = girl_count

# print("max_girls")
print(result)
