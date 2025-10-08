# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

letter_case = input()
letter_fuzz = int(input())
number_fuzz = int(input())
other_fuzz = input()
template = input()
n = int(input())
candidates = []
for _ in range(n):
    candidate = input()
    candidates.append(candidate)
# for i in range(n):
#
#     # Write an answer using print
#     # To debug: print("Debug messages...", file=sys.stderr, flush=True)
#
#     print("true/false")

template_elements = re.findall(r'\d+|.', template if letter_case == 'true' else template.lower())

results = []
for candidate in candidates:
    elements = re.findall(r'\d+|.', candidate if letter_case == 'true' else candidate.lower())
    if len(template_elements) != len(elements):
        results.append('false')
        continue

    result = True
    for template_element, element in zip(template_elements, elements, strict=True):
        if re.match(r'[a-zA-Z]', template_element) is not None:
            if re.match(r'[a-zA-Z]', element) is None or abs(ord(template_element) - ord(element)) > letter_fuzz:
                result = False

        elif re.match(r'\d+', template_element) is not None:
            if re.match(r'\d+', element) is None or abs(int(template_element) - int(element)) > number_fuzz:
                result = False

        elif re.match(r'\d+|[a-zA-Z]', element) is not None or (other_fuzz == 'true' and template_element != element):
            result = False

        if result is False:
            break

    results.append(str(result).lower())

for result in results:
    print(result)
