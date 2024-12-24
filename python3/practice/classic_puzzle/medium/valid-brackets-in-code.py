# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
lines = []
for _ in range(n):
    line = input()
    lines.append(line)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

code = ''.join(lines)

remove_escape_double_quote_code = re.sub(r'(?<!\\)\\"', '', code)
remove_double_quote_code = re.sub(r'"(.*?)"', '',  remove_escape_double_quote_code)
brackets = re.sub(r'[^(){}[\]]', '', remove_double_quote_code)

temp_brackets = str(brackets)
is_replace = True
while is_replace:
    before_temp_brackets = temp_brackets
    temp_brackets = re.sub(r'\(\)|\{\}|\[\]', '', temp_brackets)

    is_replace = before_temp_brackets != temp_brackets

result = None
if len(brackets) == 0:
    result = 'No brackets'
elif len(temp_brackets) == 0:
    result = 'Valid'
else:
    result = 'Invalid'

# print("Valid, Invalid or No brackets")
print(result)
