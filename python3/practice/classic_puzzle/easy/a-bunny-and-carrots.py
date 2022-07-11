# import sys
# import math

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

m, n = [int(i) for i in input().split()]
t = int(input())
choices = []
for i in input().split():
    choice = int(i)
    choices.append(choice)
grid = pd.DataFrame([[0] * m for _ in range(n)])
grid.iloc[0, :] += 1
grid.iloc[-1, :] += 1
grid.iloc[:, 0] += 1
grid.iloc[:, -1] += 1
grid = [list(row) for row in grid.values]
for i in range(t):

    # Write an answer using print
    # To debug: print("Debug messages...", file=sys.stderr, flush=True)

    choice = choices.pop(0)
    choice_index = choice - 1

    grid[choice_index].pop()
    eat_index = len(grid[choice_index])

    if eat_index != 0:
        grid[choice_index][eat_index - 1] += 1
    if choice_index != 0 and eat_index < len(grid[choice_index - 1]):
        grid[choice_index - 1][eat_index] += 1
    if choice_index + 1 != m and eat_index < len(grid[choice_index + 1]):
        grid[choice_index + 1][eat_index] += 1

    result = sum(sum(grid, []))

    # print("perimeter")
    print(result)
