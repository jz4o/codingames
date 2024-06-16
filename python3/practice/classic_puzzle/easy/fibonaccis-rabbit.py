# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

f0, n = (int(i) for i in input().split())
a, b = (int(i) for i in input().split())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

temp_list = [0] * n
temp_list.insert(0, f0)

for i in range(a, n + 1):
    begin_index = max(i - b, 0)
    end_index = i - a

    temp_list[i] = sum(temp_list[begin_index:end_index + 1])

result = temp_list[-1]

# print("Rabbits on time N.")
print(result)
