# import sys
# import math

import itertools

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

class Log:
    def __init__(self, time, room_index):
        self.time = time
        self.room_index = room_index


l = int(input())
f = input()
n, k = (int(i) for i in input().split())
crewmates = []
for _ in range(n):
    crewmate = input()
    crewmates.append(crewmate)
for i in range(n):

    # Write an answer using print
    # To debug: print("Debug messages...", file=sys.stderr, flush=True)

    crewmate = crewmates[i]
    logs = [Log(index, f.index(char)) for index, char in enumerate(crewmate) if char in f]

    is_sus = False
    for l, r in itertools.pairwise(logs):
        time = r.time - l.time
        distance = abs(r.room_index - l.room_index)
        distance = min(distance, len(f) - distance)

        if time < distance:
            is_sus = True
            break

    result = 'SUS' if is_sus else 'NOT SUS'

    # print("answer")
    print(result)
