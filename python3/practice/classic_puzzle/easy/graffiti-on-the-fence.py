# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.


class Report:
    def __init__(self, st, ed):
        self.st = st
        self.ed = ed


l = int(input())
n = int(input())
reports = []
for _ in range(n):
    st, ed = (int(j) for j in input().split())

    reports.append(Report(st, ed))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

reports = sorted(reports, key=lambda report: report.st)

results = []

position = 0
for report in reports:
    if position < report.st:
        results.append(f'{position} {report.st}')

    position = max(position, report.ed)

if position < l:
    results.append(f'{position} {l}')

if len(results) <= 0:
    results.append('All painted')

# print("answer")
for result in results:
    print(result)
