import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())  # the number of temperatures to analyse
ts = []
for i in input().split():
    # t: a temperature expressed as an integer ranging from -273 to 5526
    t = int(i)

    ts.append(t)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

negative_ts = list(filter(lambda t: t < 0, ts))
positive_ts = list(filter(lambda t: t > 0, ts))

if 0 in ts:
    closest_zero_negative = 0
    closest_zero_positive = 0
else:
    closest_zero_negative = max(negative_ts) if any(negative_ts) else None
    closest_zero_positive = min(positive_ts) if any(positive_ts) else None

if n == 0:
    result = 0
elif not any(negative_ts):
    result = closest_zero_positive
elif not any(positive_ts):
    result = closest_zero_negative
else:
    result = closest_zero_positive if closest_zero_negative + closest_zero_positive <= 0 else closest_zero_negative

# print("result")
print(result)
