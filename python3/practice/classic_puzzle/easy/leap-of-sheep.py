# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
heights = []
for i in input().split():
    height = int(i)
    heights.append(height)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

difficults = []
for index, height in enumerate(heights[1:-1], start=1):
    left_height = min(heights[:index])
    right_height = min(heights[index + 1:])
    if not left_height < height > right_height:
        continue

    difficults.append(height * 2 - left_height - right_height)

result = max(difficults)

# print("MAXIMAL DIFFICULTY")
print(result)
