# import sys
# import math

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

wally_width, wally_height = [int(i) for i in input().split()]
wally = ''
for i in range(wally_height):
    wally_row = input()
    wally += wally_row
picture_width, picture_height = [int(i) for i in input().split()]
picture_rows = []
for i in range(picture_height):
    picture_row = input()
    picture_rows.append(picture_row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

wally_indexes = [index for index, char in enumerate(wally) if char != ' ']
wally_chars = wally.replace(' ', '')

df_picture = pd.DataFrame(map(list, picture_rows))

result = None
for h in range(picture_height - wally_height + 1):
    for w in range(picture_width - wally_width + 1):
        picture_chars = ''.join(df_picture.iloc[h:h + wally_height, w:w + wally_width].values.ravel()[wally_indexes])
        if wally_chars == picture_chars:
            result = f'{w} {h}'
            break

    if result is not None:
        break

# print("x y")
print(result)
