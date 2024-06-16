# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
rows = []
for _ in range(n):
    row = input()
    rows.append(row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

inheritances = {}
for row in rows:
    parent, child = row.split(' > ')

    if parent not in inheritances:
        inheritances[parent] = []

    inheritances[parent].append(child)

temps = list(inheritances.keys())
is_break = False
while len(temps) > 0:
    temp = temps.pop()

    if temp[-1] in inheritances:
        for inheritance_child in inheritances[temp[-1]]:
            temps.append(temp + inheritance_child)

            if inheritance_child in temp:
                is_break = True
                break

    if is_break:
        break

result = 'consistent' if len(temps) == 0 else 'contradiction'

# print("consistent/contradiction")
print(result)
