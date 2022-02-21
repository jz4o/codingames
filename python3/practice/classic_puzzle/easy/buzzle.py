import sys
import math

import numpy as np

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n, a, b = [int(i) for i in input().split()]
k = int(input())
nums = []
for i in input().split():
    num = int(i)
    nums.append(num)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

results = []
for i in range(a, b + 1):
    is_buzzle = False

    # level 1
    # is_buzzle |= str(i).endswith('7')
    # is_buzzle |= (i % 7) == 0

    # level 2
    # temp_i = i
    # while True:
    #     is_buzzle |= str(temp_i).endswith('7')
    #     is_buzzle |= (temp_i % 7) == 0

    #     t = temp_i
    #     temp_i = sum(map(int, str(temp_i)))

    #     if temp_i == t:
    #         break

    # level 3
    # temp_i = i
    # while True:
    #     str_temp_i = str(temp_i)
    #     is_buzzle |= any([str_temp_i.endswith(str(num)) for num in nums])
    #     is_buzzle |= any([temp_i % num == 0 for num in nums])

    #     t = temp_i
    #     temp_i = sum(map(int, str(temp_i)))

    #     if temp_i == t:
    #         break

    # level 4
    temp_i = i
    while True:
        str_temp_i = np.base_repr(temp_i, n)
        is_buzzle |= any([str_temp_i.endswith(np.base_repr(num, n)) for num in nums])
        is_buzzle |= any([temp_i % num == 0 for num in nums])

        t = temp_i
        temp_i = sum([int(num, n) for num in str_temp_i])

        if temp_i == t:
            break

    results.append('Buzzle' if is_buzzle else i)

# print("Buzzle")
for result in results:
    print(result)
