# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

h = int(input())
w = int(input())
n = int(input())
passengers = []
for _ in range(n):
    passenger = input()
    passengers.append(passenger)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

sheet_names = {}
for passenger in passengers:
    name, sheet = passenger.split(',')
    sheet_names[sheet] = name

# row: back to front
# column: outer to inner
sheet_columns = 'ABCDEFGH'
center_w = w // 2
left_sheet_names = [
    [sheet_names[f'{row}{column}'] for column in sheet_columns[:center_w] if f'{row}{column}' in sheet_names]
    for row
    in reversed(range(1, h + 1))
]
right_sheet_names = [
    [sheet_names[f'{row}{column}'] for column in reversed(sheet_columns[center_w:w]) if f'{row}{column}' in sheet_names]
    for row
    in reversed(range(1, h + 1))
]

results = []
for i in range(w):
    target_sheet_names = left_sheet_names if i % 2 == 0 else right_sheet_names
    names = [target_sheet_name.pop(0) for target_sheet_name in target_sheet_names if len(target_sheet_name) > 0]

    if len(names) == 0:
        continue

    result = f'Now boarding: {",".join(names)}'
    results.append(result)

# print("Now boarding: Tinky Winky,Dipsy,La La,Po")
for result in results:
    print(result)
