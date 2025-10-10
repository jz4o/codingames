# import sys
import math
import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
input_rows = []
for _ in range(n):
    inputs = input().split()
    a = inputs[0]
    x_a = int(inputs[1])
    y_a = int(inputs[2])
    b = inputs[3]
    x_b = int(inputs[4])
    y_b = int(inputs[5])
    c = inputs[6]
    x_c = int(inputs[7])
    y_c = int(inputs[8])

    input_rows.append([a, x_a, y_a, b, x_b, y_b, c, x_c, y_c])

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

RIGHT_ANGLE = 90

def calc_distance(y_1, x_1, y_2, x_2):
    diff_y = abs(y_1 - y_2)
    diff_x = abs(x_1 - x_2)

    if diff_y == 0:
        return diff_x
    if diff_x == 0:
        return diff_y

    return math.sqrt((diff_y ** 2) + (diff_x ** 2))

def calc_angle(target, other_1, other_2):
    return math.acos(((other_1 ** 2) + (other_2 ** 2) - (target ** 2)) / (2 * other_1 * other_2)) * 180 / math.pi

def get_article(next_word):
    return 'an' if re.match(r'^[aeiou]', next_word) is not None else 'a'

results = []
for [a, x_a, y_a, b, x_b, y_b, c, x_c, y_c] in input_rows:
    vertex_names = [a, b, c]

    distance_a = calc_distance(y_b, x_b, y_c, x_c)
    distance_b = calc_distance(y_a, x_a, y_c, x_c)
    distance_c = calc_distance(y_a, x_a, y_b, x_b)
    distances = [distance_a, distance_b, distance_c]
    side_nature = None
    if len(set(distances)) == 3:
        side_nature = 'scalene'
    else:
        vertex_index = next(iter(
            index
            for index, distance
            in enumerate(distances)
            if len([d for d in distances if d == distance]) == 1
        ))
        vertex_name = vertex_names[vertex_index]

        side_nature = f'isosceles in {vertex_name}'
    side_article = get_article(side_nature)

    angle_a = round(calc_angle(distance_a, distance_b, distance_c), 1)
    angle_b = round(calc_angle(distance_b, distance_a, distance_c), 1)
    angle_c = round(calc_angle(distance_c, distance_a, distance_b), 1)
    angles = [angle_a, angle_b, angle_c]
    angle_nature = None
    if RIGHT_ANGLE in angles:
        vertex_name = vertex_names[angles.index(RIGHT_ANGLE)]

        angle_nature = f'right in {vertex_name}'
    elif any(angle > RIGHT_ANGLE for angle in angles):
        obtuse_vertex_index = next(iter(index for index, angle in enumerate(angles) if angle > RIGHT_ANGLE))
        vertex_name = vertex_names[obtuse_vertex_index]
        angle = round(angles[obtuse_vertex_index])

        angle_nature = f'obtuse in {vertex_name} ({angle}°)'
    else:
        angle_nature = 'acute'
    angle_article = get_article(angle_nature)

    result = f'{"".join(vertex_names)} is {side_article} {side_nature} and {angle_article} {angle_nature} triangle.'
    results.append(result)

# print("answer")
for result in results:
    print(result)
