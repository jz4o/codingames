# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
corner_inputs = []
for _ in range(n):
    x, y = (int(j) for j in input().split())
    corner_inputs.append((x, y))
m = int(input())
shot_inputs = []
for _ in range(m):
    x, y = (int(j) for j in input().split())
    shot_inputs.append((x, y))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


def each_cons(target_list: list, size: int):
    return [target_list[i:i + size] for i in range(len(target_list) - size + 1)]


corner_inputs.append(next(iter(corner_inputs)))

results = []
for shot_x, shot_y in shot_inputs:
    both_side_corner_tuples = []

    for corner in corner_inputs:
        corner_x, corner_y = corner
        if corner_x == shot_x:
            both_side_corner_tuples.append((corner, corner))

    for left_corner, right_corner in each_cons(corner_inputs, 2):
        left_corner_x, left_corner_y = left_corner
        right_corner_x, right_corner_y = right_corner

        min_corner_x = min(left_corner_x, right_corner_x)
        max_corner_x = max(left_corner_x, right_corner_x)

        if shot_x <= min_corner_x or max_corner_x <= shot_x:
            continue

        if left_corner_x < right_corner_x:
            both_side_corner_tuples.append((left_corner, right_corner))
        else:
            both_side_corner_tuples.append((right_corner, left_corner))

    both_side_corner_tuples: list[tuple] = list(set(both_side_corner_tuples))

    if len(both_side_corner_tuples) == 0:
        results.append('miss')
    elif len(both_side_corner_tuples) == 1:
        _, corner_y = sum(both_side_corner_tuples, ())

        results.append('hit' if shot_y == corner_y else 'miss')
    elif len(both_side_corner_tuples) == 2:
        ys = []
        for left_corner, right_corner in both_side_corner_tuples:
            left_corner_x, left_corner_y = left_corner
            right_corner_x, right_corner_y = right_corner

            corners_diff_x = abs(right_corner_x - left_corner_x)
            corners_diff_y = right_corner_y - left_corner_y

            if corners_diff_x == 0:
                ys.append(left_corner_y)
                continue

            inclination = corners_diff_y / corners_diff_x

            ys.append(left_corner_y + (inclination * (shot_x - left_corner_x)))

        results.append('hit' if min(ys) <= shot_y <= max(ys) else 'miss')

# print("hit_or_miss")
for result in results:
    print(result)
