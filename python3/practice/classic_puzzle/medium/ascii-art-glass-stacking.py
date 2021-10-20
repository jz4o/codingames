import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

stage = 0
while stage + 1 <= n:
	stage += 1
	n -= stage

GLASS_PARTS = [
	' *** ',
	' * * ',
	' * * ',
	'*****'
]
WIDTH = stage * len(GLASS_PARTS[0]) + stage - 1

results = []
for step in range(1, stage + 1):
	for glass_part in GLASS_PARTS:
		result = ' '.join([glass_part] * step).center(WIDTH)

		results.append(result)

# print("answer")
for result in results:
	print(result)
