import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
b = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

free_indexes = list(range(0, n))

go_right_indexes = [index for index, char in enumerate(b) if char == '!']
go_left_indexes = [index for index, char in enumerate(b) if char == '!']

while len(free_indexes) >= 2:
    free_indexes = [e for e in free_indexes if not e in go_right_indexes]
    free_indexes = [e for e in free_indexes if not e in go_left_indexes]

    go_right_indexes = list(map(lambda index: index + 1, go_right_indexes))
    go_left_indexes = list(map(lambda index: index - 1, go_left_indexes))

# print("0")
print(free_indexes[0])
