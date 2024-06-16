# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

TRY_POINT = 5
TRANSFORM_POINT = 2
PENA_DROP_POINT = 3

combinations = []

possible_try_times = int(n / TRY_POINT)
for try_times in reversed(range(possible_try_times + 1)):
    try_points = TRY_POINT * try_times

    possible_transformation_times = min(int((n - try_points) / TRANSFORM_POINT), try_times)
    for transformation_times in reversed(range(possible_transformation_times + 1)):
        transform_points = TRANSFORM_POINT * transformation_times

        remining_points = n - try_points - transform_points
        if remining_points % PENA_DROP_POINT == 0:
            penaltie_or_drop_times = int(remining_points / PENA_DROP_POINT)
            combinations.insert(0, f'{try_times} {transformation_times} {penaltie_or_drop_times}')

# print("tries transformations penalties")
for combination in combinations:
    print(combination)
