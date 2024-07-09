# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
input_rows = []
for _ in range(n):
    inputs = input().split()
    name = inputs[0]
    r = int(inputs[1])
    c = int(inputs[2])

    input_rows.append((name, r, c))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Apple:
    def __init__(self, name, row, column, column_condition):
        self.name = name
        self.row = row
        self.column = column
        self.column_condition = column_condition

apples = [
    Apple(name, r, c, None)
    for name, r, c
    in input_rows
]

apple_rows = sorted({apple.row for apple in apples})
for apple in apples:
    apple.column_condition = apple.column if apple_rows.index(apple.row) % 2 == 0 else -apple.column

sorted_apples = sorted(apples, key=lambda apple: (apple.row, apple.column_condition))

result = ','.join([apple.name for apple in sorted_apples])

# print("UNKNOWN")
print(result)
