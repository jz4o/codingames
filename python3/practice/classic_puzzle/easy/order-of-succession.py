# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
input_rows = []
for _ in range(n):
    inputs = input().split()
    name = inputs[0]
    parent = inputs[1]
    birth = int(inputs[2])
    death = inputs[3]
    religion = inputs[4]
    gender = inputs[5]
    input_rows.append((name, parent, birth, death, religion, gender))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class Person:
    def __init__(self, name, parent, birth, death, religion, gender):
        self.name = name
        self.parent = parent
        self.birth = birth
        self.death = death
        self.religion = religion
        self.gender = gender


people = []
for input_row in input_rows:
    name, parent, birth, death, religion, gender = input_row
    people.append(Person(name, parent, birth, death, religion, gender))

results = []
temp_people = [person for person in people if person.parent == '-']
while len(temp_people) > 0:
    temp_person = temp_people.pop(0)
    if temp_person.death == '-' and temp_person.religion.lower() != 'catholic':
        results.append(temp_person.name)

    next_people = sorted(
        [
            person
            for person
            in people
            if person.parent == temp_person.name
        ],
        key=lambda person: (-ord(person.gender), person.birth),
    )

    temp_people = [*next_people, *temp_people]

# print("orDeroFsucceSsion")
for result in results:
    print(result)
