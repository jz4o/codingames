# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
css = []
for i in range(n):
    cs = []
    for j in input().split():
        c = int(j)
        cs.append(c)
    css.append(cs)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

PARIS_LABEL = 1
ROME_LABEL = 100

city_relations = {}
for a, b in css:
    if a not in city_relations:
        city_relations[a] = []
    city_relations[a].append(b)

    if b not in city_relations:
        city_relations[b] = []
    city_relations[b].append(a)

route_patterns = []
temp_route_patterns = [[PARIS_LABEL]]
while len(temp_route_patterns) > 0:
    temp_route_pattern = temp_route_patterns.pop()
    last_city_label = temp_route_pattern[-1]

    for next_city_label in city_relations[last_city_label]:
        if next_city_label in temp_route_pattern:
            continue

        if next_city_label == ROME_LABEL:
            route_patterns.append(temp_route_pattern + [next_city_label])
            continue

        temp_route_patterns.append(temp_route_pattern + [next_city_label])

result = len(route_patterns)

# print("answer")
print(result)
