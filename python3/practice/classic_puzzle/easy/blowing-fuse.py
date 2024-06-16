# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n, m, c = (int(i) for i in input().split())
nxs = []
for i in input().split():
    nx = int(i)
    nxs.append(nx)
mxs = []
for i in input().split():
    mx = int(i)
    mxs.append(mx)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class Device:
    def __init__(self, ampere):
        self.ampere = ampere
        self.status = 'off'

    def switch(self):
        if self.status == 'on':
            self.status = 'off'
            return -self.ampere

        self.status = 'on'
        return self.ampere


devices = [Device(nx) for nx in nxs]
devices.insert(0, Device(0))

sum_ampere = 0
sum_amperes = []
for mx in mxs:
    device = devices[mx]
    sum_ampere += device.switch()

    sum_amperes.append(sum_ampere)

results = []
if max(sum_amperes) > c:
    results.append('Fuse was blown.')
else:
    results.append('Fuse was not blown.')
    results.append(f'Maximal consumed current was {max(sum_amperes)} A.')

# print("Fuse was not blown.")
# print("Maximal consumed current was XX A.")
for result in results:
    print(result)
