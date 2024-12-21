# import sys
# import math

import itertools

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
vis = []
for i in input().split():
    vi = int(i)
    vis.append(vi)
# for i in range(4):
#
#     # Write an answer using print
#     # To debug: print("Debug messages...", file=sys.stderr, flush=True)
#
#     print("answer")

def flatten(array):
    if any(isinstance(elm, list) for elm in array):
       return flatten(list(itertools.chain.from_iterable([elm if isinstance(elm, list) else [elm] for elm in array])))

    return array

class Tree:
    def __init__(self, values):
        dup_values = [*values]
        self.root = Tree.Node(dup_values.pop(0))

        for value in dup_values:
            self.root.add_node(value)

    def pre_order_values(self):
        return [value for value in flatten(self.root.pre_order_values()) if value is not None]

    def in_order_values(self):
        return [value for value in flatten(self.root.in_order_values()) if value is not None]

    def post_order_values(self):
        return [value for value in flatten(self.root.post_order_values()) if value is not None]

    def level_order_values(self):
        values = []
        target_level_nodes = [self.root]
        while len(target_level_nodes) > 0:
            values.extend(node.value for node in target_level_nodes)
            target_level_nodes = flatten([
                [value for value in [node.left, node.right] if value is not None]
                for node in target_level_nodes
            ])

        return values

    class Node:
        def __init__(self, value):
            self.value = value
            self.left = None
            self.right = None

        def add_node(self, value):
            if value < self.value and self.left is not None:
                self.left.add_node(value)
            if value < self.value and self.left is None:
                self.left = Tree.Node(value)
            if self.value < value and self.right is not None:
                self.right.add_node(value)
            if self.value < value and self.right is None:
                self.right = Tree.Node(value)

        def pre_order_values(self):
            return [
                self.value,
                (self.left.pre_order_values() if self.left is not None else None),
                (self.right.pre_order_values() if self.right is not None else None),
            ]

        def in_order_values(self):
            return [
                (self.left.in_order_values() if self.left is not None else None),
                self.value,
                (self.right.in_order_values() if self.right is not None else None),
            ]

        def post_order_values(self):
            return [
                (self.left.post_order_values() if self.left is not None else None),
                (self.right.post_order_values() if self.right is not None else None),
                self.value,
            ]

tree = Tree(vis)

results = [
    ' '.join(str(value) for value in tree.pre_order_values()),
    ' '.join(str(value) for value in tree.in_order_values()),
    ' '.join(str(value) for value in tree.post_order_values()),
    ' '.join(str(value) for value in tree.level_order_values()),
]

for result in results:
    print(result)
