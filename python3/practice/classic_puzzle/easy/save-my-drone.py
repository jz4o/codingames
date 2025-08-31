# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

x = int(input())
y = int(input())
r = int(input())
rows = []
for _ in range(y):
    row = input()
    rows.append(row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

tile_names = {
  '#': 'Block',
  '^': 'Thruster',
  '@': 'Gyroscope',
  '+': 'Fuel',
  '§': 'Core',
}

tiles_str = ''.join(c for c in ''.join(rows) if c in tile_names)
if r == 1:
    tiles_str = tiles_str[::-1]

splited_per_tiles = re.findall(r'#+|\^+|@+|\++|§+', tiles_str)
data_list = [
    f'{len(tiles)} {tile_names[tiles[0]]}{"s" if len(tiles) > 1 else ""}'
    for tiles
    in splited_per_tiles
]

result = ', '.join(data_list) if len(data_list) > 0 else 'Nothing'

# print("answer")
print(result)
