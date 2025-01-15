# import sys
import math
import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

ship = input()
wormhole = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

# print("Direction:")

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

# print("Distance:")

def get_component_value(vector, component_name):
    component_value = next(iter(re.findall(rf'([+-]?\d*){component_name}', vector)), '0')
    if re.search(r'\d', component_value) is not None:
        return int(component_value)

    return int(f'{component_value}1')

def get_direction(i, j, k):
    gcd = math.gcd(*[component for component in [i, j, k] if component is not None])

    i = i // gcd
    j = j // gcd
    k = k // gcd

    direction_components = [
        '' if i == 0 else f'+{i}i',
        '' if j == 0 else f'+{j}j',
        '' if k == 0 else f'+{k}k',
    ]

    return (
        re.sub(r'([+-])1([ijk])', r'\1\2', ''.join(direction_components))
            .replace('+-', '-')
            .removeprefix('+')
    )

def get_distance(i, j, k):
    return round(math.sqrt(i**2 + j**2 + k**2), 2)

packed_ship = ship.replace(' ', '')
packed_wormhole = wormhole.replace(' ', '')

ship_i = get_component_value(packed_ship, 'i')
ship_j = get_component_value(packed_ship, 'j')
ship_k = get_component_value(packed_ship, 'k')

wormhole_i = get_component_value(packed_wormhole, 'i')
wormhole_j = get_component_value(packed_wormhole, 'j')
wormhole_k = get_component_value(packed_wormhole, 'k')

diff_i = wormhole_i - ship_i
diff_j = wormhole_j - ship_j
diff_k = wormhole_k - ship_k
direction = get_direction(diff_i, diff_j, diff_k)
distance = get_distance(diff_i, diff_j, diff_k)

results = [
    f'Direction: {direction}',
    f'Distance: {distance}',
]

for result in results:
    print(result)
