# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

row = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

def each_slice(target_list: list, n: int):
    return [target_list[i:i + n] for i in range(0, len(target_list), n)]

people = [''.join(sliced_chars) for sliced_chars in each_slice(list(row), 2)]

people = [
    person.upper() if person.upper() in people else person
    for person
    in people
]

result_people = []
for index, person in enumerate(people):
    if not re.fullmatch(r'[A-Z][a-z]', person):
        result_people.append(person)
        continue

    neighbours = [
        people[max(index - 1, 0)],
        people[min(index + 1, len(people) - 1)],
    ]
    if all(neighbour == neighbour.lower() for neighbour in neighbours):
        result_people.append(person)
        continue

    laughings = []
    for distance in range(1, 4):
        l_distance_person = people[max(index - distance, 0)]
        r_distance_person = people[min(index + distance, len(people) - 1)]

        is_l_laughing = l_distance_person == l_distance_person.upper()
        is_r_laughing = r_distance_person == r_distance_person.upper()

        if is_l_laughing and is_r_laughing:
            laughings.append(f'{l_distance_person[-1]}{r_distance_person[0]}')
        elif is_l_laughing:
            laughings.append(l_distance_person)
        elif is_r_laughing:
            laughings.append(r_distance_person)

    result_people.append(next(iter(laughings), person))

result = ''.join(result_people)

# print("row")
print(result)
