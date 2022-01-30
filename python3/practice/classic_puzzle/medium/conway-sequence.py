import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

r = int(input())
l = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

results = [r]
for n in range(l - 1):
    temp, results = results, []
    while len(temp) > 0:
        uniq_temp = []
        for t in temp:
            if t not in uniq_temp:
                uniq_temp.append(t)

        first_element = uniq_temp[0]
        another_element = uniq_temp[1] if len(uniq_temp) >= 2 else None
        delete_size = temp.index(another_element) if another_element is not None else len(temp)

        results.extend([delete_size, first_element])

        temp = temp[delete_size:]

result = ' '.join(map(str, results))

# print("answer")
print(result)
