# import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

x = int(input())
n = int(input())
ms = []
for i in input().split():
    m = int(i)
    ms.append(m)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


def w(l, m):
    return (l - 1) * 6.5 / 100 * 10 * m


works = []
ms = sorted(ms, reverse=True)
for i in range(math.ceil(n / x)):
    l = i + 1
    begin_index = i * x
    end_index = begin_index + x

    works.extend([w(l, m) for m in ms[begin_index:end_index]])

result = f'{sum(works):.3f}'

# print("answer")
print(result)
