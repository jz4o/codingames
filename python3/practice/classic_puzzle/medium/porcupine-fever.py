# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.


class Cage:
    def __init__(self, sick, healthy, alive):
        self.sick = sick
        self.healthy = healthy
        self.alive = alive


n = int(input())
y = int(input())
cages = []
for _ in range(n):
    s, h, a = (int(j) for j in input().split())

    cages.append(Cage(s, h, a))
for i in range(y):

    # Write an answer using print
    # To debug: print("Debug messages...", file=sys.stderr, flush=True)

    alive = 0
    for cage in cages:
        sick = cage.sick * 2**i
        cage.alive -= sick
        alive += max(cage.alive, 0)

    # print("answer")
    print(alive)

    if alive == 0:
        break
