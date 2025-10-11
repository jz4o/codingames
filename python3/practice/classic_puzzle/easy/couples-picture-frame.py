# import sys
import math

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

wife = input()
husband = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

frame_size = math.lcm(len(wife), len(husband))

wife_line_chars = list(wife * int(frame_size / len(wife)))
husband_line_chars = list(husband * int(frame_size / len(husband)))

frame_grid = [[' '] * frame_size for _ in range(frame_size + 2)]

frame_grid[0] = wife_line_chars
frame_grid[-1] = husband_line_chars

frame_grid = pd.DataFrame(frame_grid).T.to_numpy()
frame_grid[0][1:len(husband_line_chars) + 1] = husband_line_chars
frame_grid[-1][1:len(wife_line_chars) + 1] = wife_line_chars
frame_grid = pd.DataFrame(frame_grid).T.to_numpy()

results = [''.join(frame_row) for frame_row in frame_grid]

# print("The Picture Frame")
for result in results:
    print(result)
