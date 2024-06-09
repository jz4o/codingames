# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

width, height, mines, x, y, seed = (int(i) for i in input().split())
# for i in range(height):
#
#     # Write an answer using print
#     # To debug: print("Debug messages...", file=sys.stderr, flush=True)
#
#     print("row")


class Prng:
    def __init__(self, seed):
        self.last_value = seed

    def generate(self):
        self.last_value = int(((214013 * self.last_value + 2531011) % 2**32) / 65536)

        return self.last_value


MINE = '#'
EMPTY = '.'

prng = Prng(seed)

grid = [
    [EMPTY for _ in range(width + 2)]
    for _
    in range(height + 2)
]

mine_log = []
while len(mine_log) < mines:
    gen_x = (prng.generate() % width) + 1
    gen_y = (prng.generate() % height) + 1

    if gen_x in range(x, x + 3) and gen_y in range(y, y + 3):
        continue

    if (gen_x, gen_y) in mine_log:
        continue

    mine_log.append((gen_x, gen_y))

    grid[gen_y][gen_x] = MINE

for mine_x, mine_y in mine_log:
    for target_y in range(mine_y - 1, mine_y + 2):
        for target_x in range(mine_x - 1, mine_x + 2):
            target_value = grid[target_y][target_x]
            if target_value == MINE:
                continue

            next_value = '1' if target_value == EMPTY else str(int(target_value) + 1)
            grid[target_y][target_x] = next_value

results = [''.join(row[1:-1]) for row in grid[1:-1]]

for result in results:
    print(result)
