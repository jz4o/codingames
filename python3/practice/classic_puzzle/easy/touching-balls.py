# import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
input_rows = []
for _ in range(n):
    x, y, z, r = [int(j) for j in input().split()]
    input_rows.append([x, y, z, r])

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Ball:
    def __init__(self, x, y, z, r):
        self.x = x
        self.y = y
        self.z = z
        self.r = r

    def __eq__(self, other):
        return all((
            isinstance(other, Ball),
            self.x == other.x,
            self.y == other.y,
            self.z == other.z,
            self.r == other.r,
        ))

    def __hash__(self):
        return hash((self.x, self.y, self.z, self.r))

balls = [Ball(x, y, z, r) for x, y, z, r in input_rows]

for ball in balls:
    distances = []
    for b in balls:
        if b == ball:
            continue

        distance_x = abs(ball.x - b.x)
        distance_y = abs(ball.y - b.y)
        distance_z = abs(ball.z - b.z)
        center_point_distance = math.sqrt(distance_x ** 2 + distance_y ** 2 + distance_z ** 2)

        distances.append(center_point_distance - ball.r - b.r)

    min_distance: float = min(distances)
    if min_distance <= 0:
        continue

    ball.r += min_distance

result = str(round(sum(ball.r ** 3 for ball in balls)))

# print("result")
print(result)
