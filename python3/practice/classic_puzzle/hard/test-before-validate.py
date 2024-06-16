# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
actions = []
for _ in range(n):
    action = input()
    actions.append(action)
nb_orders = int(input())
orders = []
for _ in range(nb_orders):
    order = input()
    orders.append(order)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

require_actions = {}
for order in orders:
    first, second, third = order.split()[:3]
    before, after = [first, third] if second == 'before' else [third, first]

    if after not in require_actions:
        require_actions[after] = []
    require_actions[after].append(before)

available_actions = list(set(actions) - set(require_actions.keys()))

temp_actions = actions

results = []
while len(temp_actions) > 0:
    action = next(iter([action for action in temp_actions if action in available_actions]))

    available_actions.remove(action)
    temp_actions.remove(action)

    for v in require_actions.values():
        if action in v:
            v.remove(action)

    unlock_actions = [k for k, v in require_actions.items() if len(v) == 0]

    available_actions.extend(unlock_actions)
    for unlock_action in unlock_actions:
        require_actions.pop(unlock_action)

    results.append(action)

# print("answer")
for result in results:
    print(result)
