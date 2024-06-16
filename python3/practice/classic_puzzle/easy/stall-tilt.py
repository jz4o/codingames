# import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
v = int(input())
speeds = []
for _ in range(n):
    speed = int(input())
    speeds.append(speed)
bends = []
for _ in range(v):
    bend = int(input())
    bends.append(bend)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class Motorcycle:
    def __init__(self, name, speed):
        self.name = name
        self.speed = speed


def motorcycle_speed(motorcycle):
    return motorcycle.speed


alphabets = 'abcdefghijklmnopqrstuvwxyz'
motorcycles = [Motorcycle(alphabets[index], speed) for index, speed in enumerate(speeds)]
staled_motorcycles = []

border_tan = math.tan(60 * math.pi / 180)
G = 9.81
border_speeds = []
for bend in bends:
    border_speed = math.sqrt(border_tan * bend * G)
    border_speeds.append(border_speed)

    bend_staled_motorcycles = [motorcycle for motorcycle in motorcycles if border_speed < motorcycle.speed]
    motorcycles = [motorcycle for motorcycle in motorcycles if motorcycle not in bend_staled_motorcycles]

    staled_motorcycles = sorted(bend_staled_motorcycles, key=motorcycle_speed, reverse=True) + staled_motorcycles

results = []
results.append(int(min(border_speeds)))
results.append('y')
results.extend([motorcycle.name for motorcycle in sorted(motorcycles, key=motorcycle_speed, reverse=True)])
results.extend([motorcycle.name for motorcycle in staled_motorcycles])

# print("answer")
for result in results:
    print(result)
