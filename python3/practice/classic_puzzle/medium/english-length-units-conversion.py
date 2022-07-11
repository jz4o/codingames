# import sys
# import math

from fractions import Fraction
import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

toconvert = input()
n = int(input())
relations = []
for i in range(n):
    relation = input()
    relations.append(relation)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

from_unit, to_unit = toconvert.split(' in ')

relation_dict = {}
relation_rates = {}
for relation in relations:
    l_size, l, r_size, r = list(*re.findall('(\\d+)\\s(.*)\\s=\\s(\\d+)\\s(.*)', relation))
    l_size = int(l_size)
    r_size = int(r_size)

    if l not in relation_dict:
        relation_dict[l] = []
    relation_dict[l].append(r)
    if r not in relation_dict:
        relation_dict[r] = []
    relation_dict[r].append(l)

    relation_rates[f'{l}->{r}'] = Fraction(r_size, l_size)
    relation_rates[f'{r}->{l}'] = Fraction(l_size, r_size)

temp_relation_patterns = [[from_unit]]
convert_relations = None
while convert_relations is None and len(temp_relation_patterns) > 0:
    temp_relation_pattern = temp_relation_patterns.pop()

    unit = temp_relation_pattern[-1]

    for converted_unit in relation_dict[unit]:
        if converted_unit == to_unit:
            convert_relations = [*temp_relation_pattern, converted_unit]
            break

        if converted_unit not in temp_relation_pattern:
            temp_relation_patterns.append([*temp_relation_pattern, converted_unit])

from_size = 1
to_size = 1
for f, t in zip(convert_relations[:-1], convert_relations[1:]):
    to_size *= relation_rates[f'{f}->{t}']

from_size *= to_size.denominator
to_size *= to_size.denominator
to_size = int(to_size)

result = f'{from_size} {from_unit} = {to_size} {to_unit}'

# print("result")
print(result)
