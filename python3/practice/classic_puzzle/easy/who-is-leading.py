# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

teams = input()
scores_1 = input()
scores_2 = input()
# for i in range(2):
#
#     # Write an answer using print
#     # To debug: print("Debug messages...", file=sys.stderr, flush=True)
#
#     print("Team name: score minutes_leading")

class Point:
    def __init__(self, timestamp, point, team):
        self.timestamp = timestamp
        self.point = point
        self.team = team

class LeadData:
    def __init__(self, team, point, advantage_time):
        self.team = team
        self.point = point
        self.advantage_time = advantage_time

TRY = 5
CONVERSION = 2
PENALTY = 3
DROPPED = 3

MATCH_TIME = 80

team_1, team_2 = teams.split(',')
try_1, conversion_1, penalty_1, dropped_1 = scores_1.split(',')
try_2, conversion_2, penalty_2, dropped_2 = scores_2.split(',')

points = []
if (try_1 or '') != '':
    points.extend(Point(int(t), TRY, team_1) for t in try_1.split())
if (conversion_1 or '') != '':
    points.extend(Point(int(t), CONVERSION, team_1) for t in conversion_1.split())
if (penalty_1 or '') != '':
    points.extend(Point(int(t), PENALTY, team_1) for t in penalty_1.split())
if (dropped_1 or '') != '':
    points.extend(Point(int(t), DROPPED, team_1) for t in dropped_1.split())
if (try_2 or '') != '':
    points.extend(Point(int(t), TRY, team_2) for t in try_2.split())
if (conversion_2 or '') != '':
    points.extend(Point(int(t), CONVERSION, team_2) for t in conversion_2.split())
if (penalty_2 or '') != '':
    points.extend(Point(int(t), PENALTY, team_2) for t in penalty_2.split())
if (dropped_2 or '') != '':
    points.extend(Point(int(t), DROPPED, team_2) for t in dropped_2.split())

points.append(Point(0, 0, ''))
points.append(Point(MATCH_TIME + 1, 0, ''))

points.sort(key=lambda point: point.timestamp)

lead_data_1 = LeadData(team_1, 0, 0)
lead_data_2 = LeadData(team_2, 0, 0)

for left, right in zip(points[:-1], points[1:]):
    if lead_data_1.point > lead_data_2.point:
        lead_data_1.advantage_time += right.timestamp - left.timestamp
    elif lead_data_1.point < lead_data_2.point:
        lead_data_2.advantage_time += right.timestamp - left.timestamp

    for lead_data in [lead_data_1, lead_data_2]:
        if lead_data.team != right.team:
            continue

        lead_data.point += right.point

results = [
    f'{lead_data_1.team}: {lead_data_1.point} {lead_data_1.advantage_time}',
    f'{lead_data_2.team}: {lead_data_2.point} {lead_data_2.advantage_time}',
]

for result in results:
    print(result)
