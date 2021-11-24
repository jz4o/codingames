import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

initial_list = list(range(1, n + 1))
center_index = n // 2
temp_list = initial_list
progress_logs = []

for i in range(n):
    front_half = temp_list[:center_index]
    back_half = temp_list[center_index:]

    temp_list = []

    for j in range(math.ceil(n / 2)):
        if j < len(back_half):
            temp_list.append(back_half[-(j + 1)])

        if j < len(front_half):
            temp_list.append(front_half[j])

    progress_logs.append(','.join(map(str, temp_list)))

result = '\n'.join(progress_logs) if temp_list == initial_list else 'IMPOSSIBLE'

# print("IMPOSSIBLE")
print(result)
