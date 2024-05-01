# import sys
# import math

from collections import defaultdict

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

c = int(input())
p = int(input())
items = []
for i in range(c):
    item = input()
    items.append(item)
orders = []
for i in range(p):
    order = input()
    orders.append(order)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

inventory = defaultdict(list)
for item in items:
    category, size, price_str = item.split(' ')
    price = int(price_str)

    key = f'{category} {size}'
    inventory[key].append(price)

for key in inventory.keys():
    inventory[key].sort()

results = []
for order in orders:
    values = inventory.get(order, [])
    results.append(str(values.pop(0)) if len(values) > 0 else 'NONE')

# print("NONE")
for result in results:
    print(result)
