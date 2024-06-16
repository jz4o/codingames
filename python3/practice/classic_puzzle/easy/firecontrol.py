# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

texts = []
for _ in range(6):
    text = input()
    texts.append(text)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class Position:
    def __init__(self, y, x, value):
        self.y = y
        self.x = x
        self.value = value


TREE = '#'
CUT_DOWN_TREE = '='
EMPTY = 'o'
FIRE = '*'

texts = [f'{EMPTY}{EMPTY}{text}{EMPTY}{EMPTY}' for text in texts]
texts.insert(0, EMPTY * len(texts[0]))
texts.insert(0, EMPTY * len(texts[0]))
texts.append(EMPTY * len(texts[0]))
texts.append(EMPTY * len(texts[0]))

positions = []
for text_index, text in enumerate(texts):
    for char_index, char in enumerate(text):
        positions.append(Position(text_index, char_index, char))

before_tree_size = len([position for position in positions if position.value == TREE])

fire_positions = [position for position in positions if position.value == FIRE]
for fire_position in fire_positions:
    for position in positions:
        if position.value != TREE:
            continue
        if not fire_position.y - 2 <= position.y <= fire_position.y + 2:
            continue
        if not fire_position.x - 2 <= position.x <= fire_position.x + 2:
            continue

        position.value = CUT_DOWN_TREE

after_tree_size = len([position for position in positions if position.value == TREE])

result = None
if len(fire_positions) == 0:
    result = 'RELAX'
elif after_tree_size == 0:
    result = 'JUST RUN'
else:
    result = before_tree_size - after_tree_size

# print("12")
print(result)
