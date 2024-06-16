# import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.


class Defib:
    def __init__(self, id_value, name, address, phone, longitude, latitude):
        self.id = id_value
        self.name = name
        self.address = address
        self.phone = phone
        self.longitude = float(longitude.replace(',', '.'))
        self.latitude = float(latitude.replace(',', '.'))


lon = float(input().replace(',', '.'))
lat = float(input().replace(',', '.'))
n = int(input())
defibs = []
for _ in range(n):
    defib = input()

    defibs.append(Defib(*defib.split(';')))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

near_defib = defibs[0]
distance = 10000
for defib in defibs:
    x = (lon - defib.longitude) * math.cos((defib.latitude + lat) // 2)
    y = lat - defib.latitude
    d = math.sqrt(x**2 + y**2) * 6371

    if distance > d:
        distance = d
        near_defib = defib

result = near_defib.name

# print("answer")
print(result)
