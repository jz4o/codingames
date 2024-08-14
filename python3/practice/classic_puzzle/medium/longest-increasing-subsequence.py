# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
ps = []
for _ in range(n):
    p = int(input())
    ps.append(p)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

temp_list = []
for p in ps:
    index = next(iter([index for index, elm in enumerate(temp_list) if p <= elm]), None)
    if index is not None:
        temp_list[index] = p
    else:
        temp_list.append(p)

result = len(temp_list)

# print("answer")
print(result)
