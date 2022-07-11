# import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.


class ThrowData:
    def __init__(self, name, x, y):
        self.name = name
        self.x = x
        self.y = y


class Score:
    def __init__(self, name, score):
        self.name = name
        self.score = score


size = int(input())
n = int(input())
names = []
for i in range(n):
    name = input()
    names.append(name)
t = int(input())
throw_datas = []
for i in range(t):
    inputs = input().split()
    throw_name = inputs[0]
    throw_x = int(inputs[1])
    throw_y = int(inputs[2])
    throw_datas.append(ThrowData(throw_name, throw_x, throw_y))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

HALF_SIZE = size // 2
score_board = {name: 0 for name in names}

for throw_data in throw_datas:
    distance_with_center = math.sqrt(throw_data.x**2 + throw_data.y**2)
    distance_with_edge = math.sqrt((HALF_SIZE - abs(throw_data.x))**2 + (HALF_SIZE - abs(throw_data.y))**2)

    in_square_horizontal = -HALF_SIZE <= throw_data.x <= HALF_SIZE
    in_square_vertical = -HALF_SIZE <= throw_data.y <= throw_data.y

    in_square = in_square_horizontal and in_square_vertical
    in_circle = distance_with_center <= HALF_SIZE
    in_diamond = distance_with_center <= distance_with_edge

    if in_diamond:
        score_board[throw_data.name] += 15
    elif in_circle:
        score_board[throw_data.name] += 10
    elif in_square:
        score_board[throw_data.name] += 5

scores = [Score(name, score) for name, score in score_board.items()]

sorted_scores = scores.copy()
sorted_scores.sort(key=lambda x: names.index(x.name))
sorted_scores.sort(key=lambda x: x.score, reverse=True)

results = [f'{score.name} {score.score}' for score in sorted_scores]

# print("answer")
for result in results:
    print(result)
