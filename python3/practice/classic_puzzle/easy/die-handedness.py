# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

lines = []
for _ in range(3):
    line = input()  # One line out of three in the string describing the arrangement of the numbers.
    lines.append(line)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

a, b, c, d, e, f = (int(char) for char in ''.join(lines).replace(' ', ''))

is_check_versus_faces = all(sum_value == 7 for sum_value in [a + f, b + d, c + e])
is_check_face_values = sorted([a, b, c, d, e, f]) == [1, 2, 3, 4, 5, 6]
is_not_degenerate = is_check_versus_faces and is_check_face_values

if is_not_degenerate:
    is_turn_over = False
    if a >= 4:
        a, f = f, a
        is_turn_over = True

    if c >= 4:
        b, c, d, e = d, e, b, c

    target_faces = [face for face in [a, b, c, d, e, f] if face in [1, 2, 3]]
    result = 'left-handed' if ('123' in ''.join(map(str, target_faces * 2))) is is_turn_over else 'right-handed'
else:
    result = 'degenerate'

# Output one of "right-handed", "left-handed" and "degenerate".
# print("handedness")
print(result)
