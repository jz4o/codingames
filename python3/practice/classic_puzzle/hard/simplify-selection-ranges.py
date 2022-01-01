import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

def add_item(array, items):
    if len(items) >= 3:
        array.append(f'{items[0]}-{items[-1]}')
    else:
        array.extend(items)


numbers = sorted(map(int, n[1:-1].split(',')))

results = []
temp = []
while len(numbers) > 0:
    if len(temp) == 0 or (temp[-1] + 1 == numbers[0]):
        temp.append(numbers.pop(0))
    else:
        add_item(results, temp)
        temp.clear()

if len(temp) > 0:
    add_item(results, temp)

result = ','.join(map(str, results))

# print("answer")
print(result)
