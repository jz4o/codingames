# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

f = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Parentheses:
    def __init__(self, begin_index, end_index, level):
        self.begin_index = begin_index
        self.end_index = end_index
        self.level = level

index_stack = []
parentheses_list = []
for index, char in enumerate(f):
    if char == '(':
        index_stack.append(index)
    elif char == ')':
        level = len(index_stack)
        begin_index = index_stack.pop()
        parentheses_list.append(Parentheses(begin_index, index, level))

max_level: int = max(parentheses.level for parentheses in parentheses_list) if len(parentheses_list) > 0 else 0
output_grid = []
output_grid.append(list(f))
if max_level > 0:
    output_grid.extend([
        [' '] * len(f)
        for _
        in range(max_level + 2)
    ])

for parentheses in parentheses_list:
    begin_index = parentheses.begin_index
    end_index = parentheses.end_index
    level = parentheses.level

    nested_parentheses_list = [
        pa
        for pa
        in parentheses_list
        if begin_index <= pa.begin_index <= end_index
    ]
    nest_level = max(pa.level for pa in nested_parentheses_list) if len(nested_parentheses_list) > 0 else 0

    arrow_head_row = 1
    arrow_shaft_rows = list(range(2, nest_level - level + 3))
    level_row = nest_level - level + 3

    for index in [begin_index, end_index]:
        output_grid[arrow_head_row][index] = '^'
        for arrow_shaft_row in arrow_shaft_rows:
            output_grid[arrow_shaft_row][index] = '|'
        output_grid[level_row][index] = str(level)

    for index in range(begin_index + 1, end_index):
        output_grid[level_row][index] = '-'

results = [''.join(output_row) for output_row in output_grid]

# print("solution")
for result in results:
    print(result)
