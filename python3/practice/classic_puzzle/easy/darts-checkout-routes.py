# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

score = int(input())
darts = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

SINGLE_SEGMENTS = [*range(1, 21), 25]
DOUBLE_SEGMENTS = [*range(1, 21), 25]
TREBLE_SEGMENTS = [*range(1, 21)]
MAX_SEGMENT_SINGLE = max(SINGLE_SEGMENTS)
MAX_SEGMENT_DOUBLE = max(DOUBLE_SEGMENTS)
MAX_SEGMENT_TREBLE = max(TREBLE_SEGMENTS)

class Route:
    def __init__(self, score=0, throws=None):
        if throws is None:
            throws = []

        self.score = score
        self.throws = throws

    def add_throw(self, throw_text):
        if 'D' in throw_text:
            self.score += int(throw_text[1:]) * 2
        elif 'T' in throw_text:
            self.score += int(throw_text[1:]) * 3
        else:
            self.score += int(throw_text)

        self.throws.append(throw_text)

routes_to_checks = []
for double_segment in set(range(1, min(score // 2, MAX_SEGMENT_DOUBLE) + 1)) & set(DOUBLE_SEGMENTS):
    route = Route(double_segment * 2, [f'D{double_segment}'])
    routes_to_checks.append(route)

checkout_routes = []
while len(routes_to_checks) > 0:
    route = routes_to_checks.pop()

    if route.score == score and len(route.throws) <= darts:
        checkout_routes.append(route)
        continue

    if route.score >= score or len(route.throws) >= darts:
        continue

    amount_score = score - route.score

    for single_segment in set(range(1, min(amount_score, MAX_SEGMENT_SINGLE) + 1)) & set(SINGLE_SEGMENTS):
        new_route = Route(route.score, [*route.throws])
        new_route.add_throw(str(single_segment))

        routes_to_checks.append(new_route)

    for double_segment in set(range(1, min(amount_score // 2, MAX_SEGMENT_DOUBLE) + 1)) & set(DOUBLE_SEGMENTS):
        new_route = Route(route.score, [*route.throws])
        new_route.add_throw(f'D{double_segment}')

        routes_to_checks.append(new_route)

    for treble_segment in set(range(1, min(amount_score // 3, MAX_SEGMENT_TREBLE) + 1)) & set(TREBLE_SEGMENTS):
        new_route = Route(route.score, [*route.throws])
        new_route.add_throw(f'T{treble_segment}')

        routes_to_checks.append(new_route)

result = str(len({','.join(route.throws) for route in checkout_routes}))

# print("answer")
print(result)
