import sys
import math

import itertools

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
families = []
for i in range(n):
    parent_1, parent_2, child = input().split()

    families.append({'parent_1': parent_1, 'parent_2': parent_2, 'child': child})

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Blood:
    def __init__(self, blood_string):
        self.type = blood_string[:-1]
        self.rh = blood_string[-1]

    def get_type_elements(self):
        return list(f'{self.type * 2}O') if len(self.type) == 1 else list(self.type)

    def get_common_format(self):
        return f'{self.type}{self.rh}'

    @classmethod
    def get_common_format_type(klass, blood_type):
        blood_type = ''.join(sorted(set(list(blood_type))))

        return blood_type[0] if blood_type[-1] == 'O' else blood_type


def predict_parent_blood_types(parent_blood, child_blood):
    candidate_rhs = ['+'] if parent_blood.rh == '-' and child_blood.rh == '+' else ['+', '-']

    parent_type_elements = parent_blood.get_type_elements()
    child_type_elements = child_blood.get_type_elements()

    other_parent_blood_elements = []
    for blood_element in parent_type_elements:
        if blood_element not in child_type_elements:
            continue

        other_parent_blood_elements.extend(list(''.join(child_type_elements).replace(blood_element, '', 1)))

    other_parent_blood_elements = set(other_parent_blood_elements)

    blood_types = ['AO', 'BO', 'OO', 'AB']

    candidate_blood_types = []
    for blood_element in other_parent_blood_elements:
        candidate_blood_types.extend([blood_type for blood_type in blood_types if blood_element in blood_type])

    candidate_blood_types = [Blood.get_common_format_type(blood_type) for blood_type in candidate_blood_types]
    candidate_blood_types = set(candidate_blood_types)

    candidate_bloods = itertools.product(candidate_blood_types, candidate_rhs)
    candidate_bloods = [f'{t}{r}' for t, r in candidate_bloods]
    candidate_bloods = sorted(candidate_bloods)

    return candidate_bloods


def predict_child_blood_types(parent_1_blood, parent_2_blood):
    candidate_rhs = ['-'] if parent_1_blood.rh == '-' and parent_2_blood.rh == '-' else ['+', '-']

    candidate_types = itertools.product(parent_1_blood.get_type_elements(), parent_2_blood.get_type_elements())
    candidate_types = [Blood.get_common_format_type(f'{t1}{t2}') for t1, t2 in candidate_types]
    candidate_types = set(candidate_types)

    candidate_type_rhs = itertools.product(candidate_types, candidate_rhs)
    candidate_type_rhs = [f'{blood_type}{rh}' for blood_type, rh in candidate_type_rhs]

    candidate_bloods = [Blood(type_rhs) for type_rhs in candidate_type_rhs]
    candidate_bloods = sorted(candidate_bloods, key=lambda blood: blood.type)

    return [candidate_blood.get_common_format() for candidate_blood in candidate_bloods]


results = []
for family in families:
    parent_1 = family['parent_1']
    parent_2 = family['parent_2']
    child = family['child']

    parent_1 = None if parent_1 == '?' else Blood(parent_1)
    parent_2 = None if parent_2 == '?' else Blood(parent_2)
    child = None if child == '?' else Blood(child)

    if child is None:
        predicted_blood_types = predict_child_blood_types(parent_1, parent_2)
    else:
        parent = parent_1 if parent_1 is not None else parent_2
        predicted_blood_types = predict_parent_blood_types(parent, child)

    results.append('impossible' if len(predicted_blood_types) == 0 else ' '.join(predicted_blood_types))

# print("answer")
for result in results:
    print(result)
