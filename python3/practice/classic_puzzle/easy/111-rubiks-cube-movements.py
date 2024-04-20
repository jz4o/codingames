# import sys
# import math

from functools import reduce

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

rotations = input()
face_1 = input()
face_2 = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

rotation_dict = {
    'x': {
        'U': 'B',
        'F': 'U',
        'D': 'F',
        'B': 'D'
    },
    "x'": {
        'U': 'F',
        'F': 'D',
        'D': 'B',
        'B': 'U'
    },
    'y': {
        'L': 'B',
        'F': 'L',
        'R': 'F',
        'B': 'R'
    },
    "y'": {
        'L': 'F',
        'F': 'R',
        'R': 'B',
        'B': 'L'
    },
    'z': {
        'U': 'R',
        'L': 'U',
        'D': 'L',
        'R': 'D'
    },
    "z'": {
        'U': 'L',
        'L': 'D',
        'D': 'R',
        'R': 'U'
    }
}

[after_face_1, after_face_2] = reduce(
    lambda fs, rotation: [rotation_dict[rotation].get(f, f) for f in fs],
    rotations.split(' '),
    [face_1, face_2]
)

results = [after_face_1, after_face_2]

# print("face1")
# print("face2")
for result in results:
    print(result)
