# import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
c = int(input())
budgets = []
for i in range(n):
    b = int(input())

    budgets.append(b)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

results = []
if sum(budgets) < c:
    results.append('IMPOSSIBLE')
else:
    lack = c
    budgets.sort()
    for index, budget in enumerate(budgets):
        average = math.floor(lack / (len(budgets) - index))
        pay = min(budget, average)

        lack -= pay

        results.append(pay)

# print("IMPOSSIBLE")
for result in results:
    print(result)
