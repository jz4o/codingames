# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

height = int(input())
rows = []
for _ in range(height):
    row = input()
    rows.append(row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

split_column_indexes = [index for index, value in enumerate(next(iter(rows))) if value == ':']
split_row_indexes = [index for index, row in enumerate(rows) if row.startswith('-')]

attendees_grid = [[0] * 3 for _ in range(3)]
for row_index, row in enumerate(rows):
    grid_row_indexes = [
        index
        for index, split_row_index
        in enumerate(split_row_indexes)
        if row_index < split_row_index
    ]
    grid_row_index = next(iter(grid_row_indexes), 2)

    for column_index, value in enumerate(row):
        if value != '*':
            continue

        grid_column_indexes = [
            index
            for index, split_column_index
            in enumerate(split_column_indexes)
            if column_index < split_column_index
        ]
        grid_column_index = next(iter(grid_column_indexes), 2)

        attendees_grid[grid_row_index][grid_column_index] += 1

total_attendees = ''.join(rows).count('*')
attendees_percentage_rows = []
for attendees_row in attendees_grid:
    attendees_percentages = []
    for attendees in attendees_row:
        percentage = attendees / total_attendees * 100
        attendees_percentage = f'{str(round(percentage)).rjust(3, "_")}%'
        attendees_percentages.append(attendees_percentage)

    attendees_percentage_row = ' '.join(attendees_percentages)
    attendees_percentage_rows.append(attendees_percentage_row)

results = []
results.append(f'{total_attendees} attendees')
results.extend(attendees_percentage_rows)

# print("total, and popularity of each")
for result in results:
    print(result)
