# import sys
import math

import numpy as np

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

fingerprint = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


def each_slice(target_list, size):
    return [target_list[i * size:(i + 1) * size] for i in range(math.ceil(len(target_list) / size))]


class Bishop:
    ART_MAX_WEIGHT = 8
    ART_MAX_WIDTH = 16
    SYMBOLS = ' .o+=*BOX@%&#/^'

    @classmethod
    def draw_art(cls, fingerprint):
        cls.__walk(fingerprint)

        ascii_art_grid = []
        for y in range(cls.ART_MAX_WEIGHT + 1):
            row = []
            for x in range(cls.ART_MAX_WIDTH + 1):
                row.append(cls.SYMBOLS[cls.counter.get(f'{y}:{x}', 0)])
            ascii_art_grid.append(row)

        ascii_art_grid[cls.start_y][cls.start_x] = 'S'
        ascii_art_grid[cls.end_y][cls.end_x] = 'E'

        ascii_art = [f'|{"".join(map(str, ascii_row))}|' for ascii_row in ascii_art_grid]
        ascii_art.insert(0, '+---[CODINGAME]---+')
        ascii_art.append('+-----------------+')

        return ascii_art

    @classmethod
    def __walk(cls, fingerprint):
        cls.counter = {}

        position_y = 4
        position_x = 8

        cls.start_y = position_y
        cls.start_x = position_x

        for hexa in each_slice(list(fingerprint.replace(':', '')), 2):
            binary_str = ''.join([np.base_repr(int(h, 16), 2).rjust(4, '0') for h in hexa])
            for [x, y] in each_slice(list(reversed(binary_str)), 2):
                position_y = max(position_y - 1, 0) if y == '0' else min(position_y + 1, cls.ART_MAX_WEIGHT)
                position_x = max(position_x - 1, 0) if x == '0' else min(position_x + 1, cls.ART_MAX_WIDTH)

                counter_key = f'{position_y}:{position_x}'
                cls.counter[counter_key] = (cls.counter.get(counter_key, 0) + 1) % len(cls.SYMBOLS)

        cls.end_y = position_y
        cls.end_x = position_x


results = Bishop.draw_art(fingerprint)

# print("ASCII Art Image")
for result in results:
    print(result)
