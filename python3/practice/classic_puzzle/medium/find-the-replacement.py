# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

x = input()
y = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

replace_dict = {xi: yi for xi, yi in zip(x, y, strict=True) if xi != yi}

replace_result = x.translate(str.maketrans(replace_dict))

result = ''
if x == y:
    result = 'NONE'
elif replace_result == y:
    result = '\n'.join([f'{k}->{v}' for k, v in replace_dict.items()])
else:
    result = "CAN'T"

# print("anwser")
print(result)
