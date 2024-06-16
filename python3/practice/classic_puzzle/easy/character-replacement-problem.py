# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

s = input()
n = int(input())
ms = []
for _ in range(n):
    m = input()
    ms.append(m)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

s_elements = [s_element for s_element in s.split(' ') if s_element[0] != s_element[1]]
replace_from_chars = {s_element[0] for s_element in s_elements}

replace_dict = {}
for s_element in s_elements:
    replace_dict[s_element[0]] = s_element[1]

replace_roads = {}
for f in replace_from_chars:
    road = [f]
    while road[-1] in replace_dict:
        t = replace_dict[road[-1]]

        is_exist = t in road

        road.append(t)

        if is_exist:
            break

    replace_roads[f] = road

is_ambigious_error = len(s_elements) != len(replace_from_chars)
is_loop_error = any(road.index(road[-1]) != len(road) - 1 for road in replace_roads.values())

replaced_ms = []
for m in ms:
    replaced_m = ''.join([replace_roads.get(c, [None])[-1] or c for c in list(m)])
    replaced_ms.append(replaced_m)

results = ['ERROR'] if is_ambigious_error or is_loop_error else replaced_ms

# print("The final figure or ERROR")
for result in results:
    print(result)
