# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

c = int(input())
wirings = []
for _ in range(c):
    wiring = input()
    wirings.append(wiring)
a = int(input())
switches = []
for _ in range(a):
    switch = input()
    switches.append(switch)
switch_status = {switch: switches.count(switch) % 2 == 1 for switch in list(set(switches))}
DESCRIPTION_TYPES = ['-', '=']
for i in range(c):
    # Write an answer using print
    # To debug: print("Debug messages...", file=sys.stderr, flush=True)

    wiring = wirings[i]
    wiring_elements = wiring.split()

    equipment = wiring_elements.pop(0)
    equipment_description_switches = []
    while len(wiring_elements) > 0:
        description_type_index = max([index for index, elm in enumerate(wiring_elements) if elm in DESCRIPTION_TYPES])

        description_type = wiring_elements[description_type_index]
        description_switches = wiring_elements[description_type_index + 1:]
        wiring_elements = wiring_elements[:description_type_index]

        method = all if description_type == '-' else any
        description_switch_statuses = [s in switch_status and switch_status[s] for s in description_switches]
        equipment_description_switches.append(method(description_switch_statuses))

    result = f'{equipment} is {"ON" if all(equipment_description_switches) else "OFF"}'

    # print("ANSWER")
    print(result)
