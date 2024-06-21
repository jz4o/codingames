# import sys
# import math

from functools import reduce

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

p = int(input())
properties = []
for _ in range(p):
    _property = input()
    properties.append(_property)
n = int(input())
person_rows = []
for _ in range(n):
    person = input()
    person_rows.append(person)
f = int(input())
formulas = []
for _ in range(f):
    formula = input()
    formulas.append(formula)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

properties.insert(0, 'name')

people = []
for person_row in person_rows:
    person_properties = person_row.split()

    person = {}
    for property_name, person_property in zip(properties, person_properties):
        person[property_name] = person_property

    people.append(person)

def filter_person(people, condition):
    property_name, value = condition
    return [person for person in people if person.get(property_name) == value]

results = []
for formula in formulas:
    conditions = [condition.split('=') for condition in formula.split(' AND ')]
    result_people = reduce(filter_person, conditions, people)

    results.append(len(result_people))

# print("answer")
for result in results:
    print(result)
