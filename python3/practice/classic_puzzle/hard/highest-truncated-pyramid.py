# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())

# # Auto-generated code below aims at helping you parse
# # the standard input according to the problem statement.

part_count = 1
top_step_count = 1
bottom_step_count = 1
while part_count != n:
    if part_count < n:
        bottom_step_count += 1
        part_count += bottom_step_count
    elif n < part_count:
        part_count -= top_step_count
        top_step_count += 1

results = ['*' * step_count for step_count in range(top_step_count, bottom_step_count + 1)]

for result in results:
    print(result)
