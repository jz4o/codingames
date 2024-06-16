# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

road_length = int(input())  # The total kilometers of the route.
zone_quantity = int(input())  # The number of road construction sites.
zone_rows = []
for _ in range(zone_quantity):
    # zone_km: The kilometer in which the road construction site begins.
    # zone_speed: The speed limit of the road construction site.
    zone_km, zone_speed = (int(j) for j in input().split())
    zone_rows.append([zone_km, zone_speed])

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

LIMIT_SPEED = 130
HOUR_MINUTES = 60

ideal_minutes = road_length / LIMIT_SPEED * HOUR_MINUTES

zone_rows.insert(0, [0, LIMIT_SPEED])
zone_rows.append([road_length, 0])
actual_minutes = 0
for index in range(len(zone_rows) - 1):
    zone_km, zone_speed = zone_rows[index]
    next_zone_km, _next_zone_speed = zone_rows[index + 1]

    actual_minutes += (next_zone_km - zone_km) / zone_speed * HOUR_MINUTES

result = str(round(actual_minutes - ideal_minutes))

# Difference between theoretical time and travel time
# print("0.00")
print(result)
