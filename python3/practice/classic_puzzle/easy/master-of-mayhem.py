# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

cyborg_count = int(input())
cyborg_names = []
for _ in range(cyborg_count):
    cyborg_name = input()
    cyborg_names.append(cyborg_name)
mayhem_report_count = int(input())
mayhem_reports = []
for _ in range(mayhem_report_count):
    mayhem_report = input()
    mayhem_reports.append(mayhem_report)
cyborg_report_count = int(input())
cyborg_reports = []
for _ in range(cyborg_report_count):
    cyborg_report = input()
    cyborg_reports.append(cyborg_report)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

mayhem_attributes = {}
for mayhem_report in mayhem_reports:
    attribute, *_, value = list(*re.findall('^Mayhem\'s (.*?) (is)?( an?)? "?(.*?)"?$', mayhem_report))
    mayhem_attributes[attribute] = value

cyborgs_attributes = {name: {} for name in cyborg_names}
for cyborg_report in cyborg_reports:
    name, attribute, *_, value = list(*re.findall('^(.*)\'s (.*?) (is)?( an?)? "?(.*?)"?$', cyborg_report))

    cyborgs_attributes[name][attribute] = value

for mayhem_attribute, mayhem_value in mayhem_attributes.items():
    for cyborg_name, cyborg_attributes in list(cyborgs_attributes.items()):
        if mayhem_attribute == 'word':
            if 'catchphrase' not in cyborg_attributes:
                continue

            if mayhem_value not in cyborg_attributes['catchphrase']:
                cyborgs_attributes.pop(cyborg_name)
        else:
            if mayhem_attribute not in cyborg_attributes:
                continue

            if mayhem_value != cyborg_attributes[mayhem_attribute]:
                cyborgs_attributes.pop(cyborg_name)

candidate_cyborg_names = list(cyborgs_attributes.keys())

result = None
if len(candidate_cyborg_names) == 0:
    result = 'MISSING'
elif len(candidate_cyborg_names) == 1:
    result = candidate_cyborg_names[0]
elif len(candidate_cyborg_names) >= 2:
    result = 'INDETERMINATE'

# print("CYBORG")
print(result)
