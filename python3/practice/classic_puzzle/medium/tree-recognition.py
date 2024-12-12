# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n, k = [int(i) for i in input().split()]
nodes = []
for _ in range(n):
    node = []
    for j in input().split():
        node_value = int(j)
        node.append(node_value)
    nodes.append(node)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

def get_node_shape(node):
    branches = [node]

    step = 1
    while max(len(branch) for branch in branches) > step:
        next_branches = []
        for branch in branches:
            prefix = branch[:step]
            if len(branch) < step:
                next_branches.append(prefix)
                next_branches.append(prefix)
                continue

            target_value = branch[step - 1]
            smaller = [value for value in branch[step:] if value < target_value]
            bigger = [value for value in branch[step:] if value > target_value]

            next_branches.append(prefix + smaller)
            next_branches.append(prefix + bigger)
        branches = next_branches

        step += 1

    return ','.join(str(len(branch)) for branch in branches)

result = len({get_node_shape(node) for node in nodes})

# print("answer")
print(result)
