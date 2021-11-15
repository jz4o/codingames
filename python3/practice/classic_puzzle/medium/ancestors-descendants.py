import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

class Generation:
    def __init__(self, level, name):
        self.level = level
        self.name = name

count = int(input())
generations = []
for i in range(count):
    line = input()

    level = line.count('.')
    generations.append(Generation(level, line[level:]))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

results = []
while len(generations) > 0:
    result = []
    for l in reversed(range(generations[-1].level + 1)):
        generation = list(filter(lambda generation: generation.level == l, generations))[-1]
        result.insert(0, generation.name)

    results.insert(0, ' > '.join(result))

    temp = generations.pop()
    while len(generations) > 0 and generations[-1].level < temp.level:
        temp = generations.pop()

# print("answer")
for result in results:
    print(result)
