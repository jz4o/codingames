import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
telephones = []
for i in range(n):
    telephone = input()

    telephones.append(telephone)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

number_tree = {}
for telephone in telephones:
    target_tree = number_tree
    for num in telephone:
        if not num in target_tree.keys():
            target_tree[num] = {}

        target_tree = target_tree[num]

result = str(number_tree).count(':')

# The number of elements (referencing a number) stored in the structure.
# print("number")
print(result)
