import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w, h = [int(i) for i in input().split()]
x, y = [int(i) for i in input().split()]
grid = []
grid.append([None] * (w + 2))
for i in range(h):
    r = input()

    grid.append([None, *list(r), None])

grid.append([None] * (w + 2))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Mass:
    def __init__(self, y, x):
        self.y = y
        self.x = x

    def __str__(self):
        return f'{self.y} {self.x}'

checked_masses = []
be_check_masses = []
exit_masses = []

be_check_masses.append(Mass(y + 1, x + 1))
while len(be_check_masses) > 0:
    check_mass = be_check_masses.pop(0)
    mass_y = check_mass.y
    mass_x = check_mass.x

    if str(check_mass) in checked_masses:
        continue

    checked_masses.append(str(check_mass))

    near_masses = [
        Mass(mass_y, mass_x - 1),
        Mass(mass_y - 1, mass_x),
        Mass(mass_y, mass_x + 1),
        Mass(mass_y + 1, mass_x)
    ]

    for near_mass in near_masses:
        mass = grid[near_mass.y][near_mass.x]

        if mass == None:
            exit_masses.append(Mass(mass_x - 1, mass_y - 1))
        elif mass == '.':
            be_check_masses.append(Mass(near_mass.y, near_mass.x))

exit_masses.sort(key = lambda mass: (mass.y, mass.x))

# print("answer")
print(len(exit_masses))
for exit_mass in exit_masses:
    print(exit_mass)
