# import sys
# import math

from collections import defaultdict

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

start = input()
end = input()
n = int(input())
station_rows = []
for _ in range(n):
    station_1, station_2 = input().split()
    station_rows.append((station_1, station_2))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

station_mapping = defaultdict(list)
for station_1, station_2 in station_rows:
    station_mapping[station_1] += [station_2]
    station_mapping[station_2] += [station_1]

temp_station_paths = [[start]]
while all(path[-1] != end for path in temp_station_paths):
    next_temp_station_paths = []
    for temp_station_path in temp_station_paths:
        next_temp_station_paths.extend([
            [*temp_station_path, next_station]
            for next_station in station_mapping[temp_station_path[-1]]
            if next_station not in temp_station_path
        ])

    temp_station_paths = next_temp_station_paths

station_path = next(iter(path for path in temp_station_paths if path[-1] == end))

result = ' > '.join(station_path)

# print("answer")
print(result)
