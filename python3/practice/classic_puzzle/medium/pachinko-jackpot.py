# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.
# NOTE:
# In the default code, a single prize is read before the
# rest are read in a loop due to a current limitation in
# stub generation. The number of prizes is (1 + height)

height = int(input())
increments_rows = []
for _ in range(height):
    increments = input()
    increments_rows.append(increments)
prizes = []
prize_1 = int(input())
prizes.append(prize_1)
for _ in range(height):
    prize = int(input())
    prizes.append(prize)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

increment_grid = [
    [int(increment) for increment in increments_row]
    for increments_row
    in increments_rows
]

counter_grid = []
for increment_row in increment_grid:
    counter_row = []
    for index, increment in enumerate(increment_row):
        top_left_increment = 0 if index == 0 else counter_grid[-1][index - 1]
        top_right_increment = 0 if len(counter_grid) == 0 or len(counter_grid[-1]) <= index else counter_grid[-1][index]

        counter_row.append(max(top_left_increment, top_right_increment) + increment)
    counter_grid.append(counter_row)

last_counter_row = counter_grid[-1]
total_counters = [max(l, r) for l, r in zip([0, *last_counter_row], [*last_counter_row, 0], strict=True)]

possible_wins = [total_count * prize for total_count, prize in zip(total_counters, prizes, strict=True)]

result = max(possible_wins)

# print("jackpot")
print(result)
