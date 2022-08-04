# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
k = int(input())
lis = []
for i in input().split():
    li = int(i)
    lis.append(li)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

i = k
while i > 0:
    lis = sorted(lis)

    size = min(lis.count(lis[0]), i)

    lis[:size] = [lis[0] + 1] * size
    i -= size

result = max(lis) - min(lis)

# print("answer")
print(result)
