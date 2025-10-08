# import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

value_to_reach = int(input())
n = int(input())
counts = []
for i in input().split():
    count = int(i)
    counts.append(count)
values = []
for i in input().split():
    value = int(i)
    values.append(value)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

count_values = [[count, value] for count, value in zip(counts, values, strict=True)]
count_values.sort(key=lambda count_value: count_value[1])

sum_value = sum([count * value for count, value in count_values])

result_num = None
if sum_value < value_to_reach:
    result_num = -1
else:
    temp_value_to_reach = value_to_reach

    sum_count = 0
    for count, value in count_values:
        pay_count: int = min(math.ceil(temp_value_to_reach / value), count)

        sum_count += pay_count
        temp_value_to_reach -= pay_count * value

        if temp_value_to_reach <= 0:
            break

    result_num = sum_count

result = str(result_num)

# print("-1")
print(result)
