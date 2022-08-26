# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

tributes = int(input())
tribute_dict = {}
for i in range(tributes):
    player_name = input()
    tribute_dict[player_name] = {'killed': []}
turns = int(input())
infos = []
for i in range(turns):
    info = input()
    infos.append(info)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

for info in infos:
    killer, _, *people_killed = info.split()

    for killed in people_killed:
        killed = killed.replace(',', '')
        tribute_dict[killed]['killer'] = killer
        tribute_dict[killer]['killed'].append(killed)

results = []
for player_name in sorted(tribute_dict.keys()):
    result = tribute_dict[player_name]

    killed = 'None' if len(result['killed']) == 0 else ', '.join(sorted(result['killed']))
    killer = result['killer'] if 'killer' in result else 'Winner'

    results.append(f'Name: {player_name}')
    results.append(f'Killed: {killed}')
    results.append(f'Killer: {killer}')
    results.append('')  # for empty line

# remove last empty line
results.pop()

# print("Name:")
# print("Killed:")
# print("Killer:")
for result in results:
    print(result)
