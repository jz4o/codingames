import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

op_bowls = input()
my_bowls = input()
num = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

op_bowls = [int(c) for c in op_bowls.split()]
my_bowls = [int(c) for c in my_bowls.split()]

BOWLS_SIZE = 7
PLAYER_SIZE = 2

bowls = [op_bowls, my_bowls]
seeds = my_bowls[num]
my_bowls[num] = 0
index = num + 1
while seeds > 0:
    row_index = (((index // BOWLS_SIZE) % PLAYER_SIZE) - 1) * -1
    column_index = index % BOWLS_SIZE

    enemy_store = row_index == 0 and column_index == BOWLS_SIZE - 1
    if enemy_store:
        index += 1
        continue

    bowls[row_index][column_index] += 1
    index += 1
    seeds -= 1

results = []
results.append(f'{" ".join(map(str, op_bowls[:-1]))} [{op_bowls[-1]}]')
results.append(f'{" ".join(map(str, my_bowls[:-1]))} [{my_bowls[-1]}]')
if index % BOWLS_SIZE == 0:
    results.append('REPLAY')

# print("answer")
for result in results:
    print(result)
