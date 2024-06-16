# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
piles = []
for i in input().split():
    c = int(i)

    piles.append(c)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

piles = list(filter(lambda c: c != 0, piles))

same_configuration_index = 0
configurations = []
while True:
    configurations.append(' '.join(map(str, sorted(piles))))

    piles_size = len(piles)
    piles = [pile - 1 for pile in piles if pile > 1]
    piles.append(piles_size)

    configuration = ' '.join(map(str, sorted(piles)))

    if configuration in configurations:
        same_configuration_index = configurations.index(configuration)
        break

result = len(configurations) - same_configuration_index

# print("1")
print(result)
