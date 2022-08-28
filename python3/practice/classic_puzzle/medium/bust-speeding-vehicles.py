# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

l = int(input())
n = int(input())
rs = []
for i in range(n):
    r = input()
    rs.append(r)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class Record:
    def __init__(self, number, distance, timestamp):
        self.number = number
        self.distance = distance
        self.timestamp = timestamp


records = []
for r in rs:
    number, distance, timestamp = r.split()
    distance = int(distance)
    timestamp = int(timestamp)

    records.append(Record(number, distance, timestamp))

results = []
for l_record, r_record in zip(records[:-1], records[1:]):
    if l_record.number != r_record.number:
        continue

    time = r_record.timestamp - l_record.timestamp
    distance = r_record.distance - l_record.distance

    speed = distance / (time / 60 / 60)

    if l < speed:
        results.append(f'{r_record.number} {r_record.distance}')

if len(results) == 0:
    results.append('OK')

# print("result")
for result in results:
    print(result)
