# import sys
import math

import numpy as np

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
lines = []
for i in range(n):
    name, r, m, c = input().split()
    lines.append([name, r, m, c])

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class Planet:
    def __init__(self, name, r, m, c):
        self.name = name
        self.r = r
        self.m = m
        self.c = c


planets = []
for line in lines:
    name, r, m, c = line
    [r, m, c] = map(float, [r, m, c])

    planets.append(Planet(name, r, m, c))

alice = next((planet for planet in planets if planet.name == 'Alice'), None)
planets.remove(alice)

ra = alice.r
va = 4 / 3 * math.pi * ra**3
da = alice.m / va

closest_planet = None
for planet in sorted(planets, key=lambda planet: planet.c):
    rp = planet.r
    vp = 4 / 3 * math.pi * rp**3
    dp = planet.m / vp

    roche_limit = ra * np.cbrt(2 * da / dp)

    if roche_limit < planet.c:
        closest_planet = planet
        break

result = closest_planet.name

# print("answer")
print(result)
