# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.


class ScanResult:
    def __init__(self, plate, radarname, radarpoint, timestamp):
        self.plate = plate
        self.radarname = radarname
        self.radarpoint = radarpoint
        self.timestamp = timestamp


n = int(input())
scan_results = []
for _ in range(n):
    inputs = input().split()
    plate = inputs[0]
    radarname = inputs[1]
    timestamp = int(inputs[2])

    radarpoint = int(radarname.split('-')[-1])

    scan_results.append(ScanResult(plate, radarname, radarpoint, timestamp))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

scan_results.sort(key=lambda sr: (sr.plate, sr.radarpoint))

scan_results_each_car = {}
for scan_result in scan_results:
    if scan_result.plate not in scan_results_each_car:
        scan_results_each_car[scan_result.plate] = []

    scan_results_each_car[scan_result.plate].append(scan_result)

results = []
for plate, scan_results_for_car in scan_results_each_car.items():
    speeds = []
    for i in range(len(scan_results_for_car) - 1):
        l = scan_results_for_car[i]
        r = scan_results_for_car[i + 1]

        distance = r.radarpoint - l.radarpoint
        time = r.timestamp - l.timestamp

        speeds.append(distance / time * 1000 * 60 * 60)

    max_speed = int(max(speeds))

    if max_speed > 130:
        results.append(f'{plate} {max_speed}')

# print("ticket")
for result in results:
    print(result)
