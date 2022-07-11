# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
strengths = []
for i in range(n):
    v, e = [int(j) for j in input().split()]
    strengths.append({'v': v, 'e': e})

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

distances = []
for index, left in enumerate(strengths, start=1):
    for right in strengths[index:]:
        distance = abs(right['v'] - left['v']) + abs(right['e'] - left['e'])
        distances.append(distance)

result = min([distance for distance in distances if distance >= 0])

# print("42")
print(result)
