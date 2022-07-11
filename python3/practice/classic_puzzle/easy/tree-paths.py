# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.


class Node:
    def __init__(self, node_index, child_index_l, child_index_r):
        self.node_index = node_index
        self.child_index_l = child_index_l
        self.child_index_r = child_index_r

    def has_child(self, node_index):
        return node_index in [self.child_index_l, self.child_index_r]

    def direction(self, child_node_index):
        if not self.has_child(child_node_index):
            return None

        return 'Left' if self.child_index_l == child_node_index else 'Right'


n = int(input())
v = int(input())
m = int(input())
nodes = []
for i in range(m):
    p, l, r = [int(j) for j in input().split()]
    nodes.append(Node(p, l, r))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

tree_path = []

target_node_index = v
while True:
    parent_node_candidates = [node for node in nodes if node.has_child(target_node_index)]
    if len(parent_node_candidates) == 0:
        break

    parent_node = parent_node_candidates[0]

    tree_path.insert(0, parent_node.direction(target_node_index))
    target_node_index = parent_node.node_index

result = 'Root' if len(tree_path) == 0 else ' '.join(tree_path)

# print("tree_path")
print(result)
