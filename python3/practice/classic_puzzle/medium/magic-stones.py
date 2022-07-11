# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
stones = []
for i in input().split():
    level = int(i)

    stones.append(level)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

stone_count = 0
levels = sorted(set(stones))
while len(levels) > 0:
    level = levels.pop(0)
    target_stone_count = stones.count(level)
    next_level_stone_count, target_stone_count = divmod(target_stone_count, 2)
    stones = list(filter(lambda s: s != level, stones))

    if next_level_stone_count > 0:
        stones.extend([level + 1] * next_level_stone_count)
        levels.insert(0, level + 1)

    stone_count += target_stone_count

# print("1")
print(stone_count)
