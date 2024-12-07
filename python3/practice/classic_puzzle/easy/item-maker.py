# import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

data = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Item:
    def __init__(self, name, rarity, *attributes: str):
        self.name = name
        self.rarity = rarity
        self.attributes = attributes

class ItemInterface:
    class Frame:
        def __init__(
            self,
            top_left_parts,
            top_parts,
            top_right_parts,
            body_side_parts,
            bottom_left_parts,
            bottom_parts,
            bottom_right_parts,
        ):
            self.top_left_parts = top_left_parts
            self.top_parts = top_parts
            self.top_right_parts = top_right_parts
            self.body_side_parts = body_side_parts
            self.bottom_left_parts = bottom_left_parts
            self.bottom_parts = bottom_parts
            self.bottom_right_parts = bottom_right_parts

    @classmethod
    def create_ascii(cls, item):
        ascii_rows = cls.create_ascii_rows(item)
        return cls.surround_with_frame(ascii_rows, item.rarity)

    @classmethod
    def create_ascii_rows(cls, item):
        name = f'-{item.name}-'
        rarity = item.rarity
        attributes = item.attributes

        width = max(len(elm) for elm in [name, rarity, *attributes])

        name_space_size = width - len(name)
        rarity_space_size = width - len(rarity)

        ascii_rows = []
        ascii_rows.append(f'{" " * math.ceil(name_space_size / 2)}{name}{" " * (name_space_size // 2)}')
        ascii_rows.append(f'{" " * math.ceil(rarity_space_size / 2)}{rarity}{" " * (rarity_space_size // 2)}')
        ascii_rows.extend([attribute.replace(':', ' ').ljust(width) for attribute in item.attributes])

        return ascii_rows

    @classmethod
    def surround_with_frame(cls, ascii_rows, rarity):
        width = len(next(iter(ascii_rows))) + (2 * 2)

        frames = {
            'Common': cls.Frame('#', '#', '#', '#', '#', '#', '#'),
            'Rare': cls.Frame('/', '#', '\\', '#', '\\', '#', '/'),
            'Epic': cls.Frame('/', '-', '\\', '|', '\\', '_', '/'),
            'Legendary': cls.Frame('X', '-', 'X', '|', 'X', '_', 'X'),
        }
        frame = frames[rarity]

        ascii_rows = [
            f'{frame.body_side_parts} {ascii_row} {frame.body_side_parts}'
            for ascii_row
            in ascii_rows
        ]
        ascii_rows.insert(0, f'{frame.top_left_parts}{frame.top_parts * (width - 2)}{frame.top_right_parts}')
        ascii_rows.append(f'{frame.bottom_left_parts}{frame.bottom_parts * (width - 2)}{frame.bottom_right_parts}')

        if rarity == 'Legendary':
            name_row_index = 1
            ascii_rows[name_row_index] = f'[{ascii_rows[name_row_index][1:-1]}]'

            center_index = width // 2
            if width % 2 == 0:
                ascii_rows[0] = f'{ascii_rows[0][:center_index - 2]}\\__/{ascii_rows[0][center_index + 2:]}'
            else:
                ascii_rows[0] = f'{ascii_rows[0][:center_index - 1]}\\_/{ascii_rows[0][center_index + 2:]}'

        return ascii_rows

item = Item(*data.split(','))
results = ItemInterface.create_ascii(item)

# print("A ready-to-play item!")
for result in results:
    print(result)
