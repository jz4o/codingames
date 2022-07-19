# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

m = int(input())
lines = []
for i in range(m):
    line = input()
    lines.append(line)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

lines = [list(map(int, line.split())) for line in lines]

tc_n60 = 0
for line in lines:
    tc_n60 += 10 + (sum(line) - 40) / 7
tc_n60 = round(tc_n60 / len(lines), 1)

tc_n8 = None
if 5 <= tc_n60 <= 30:
    chirps = sum(lines, [])
    if len(chirps) % 2 == 1:
        chirps.pop()

    tc_n8 = 0
    for i in range(0, len(chirps), 2):
        tc_n8 += chirps[i] + chirps[i + 1] + 5
    tc_n8 = round(tc_n8 / (len(chirps) / 2), 1)

results = [result for result in [tc_n60, tc_n8] if result]

# print("answer")
for result in results:
    print(result)
