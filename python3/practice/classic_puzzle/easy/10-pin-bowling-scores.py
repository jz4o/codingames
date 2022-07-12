# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
games = []
for i in range(n):
    game = input()
    games.append(game)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class Score:
    def __init__(self, point, frame):
        self.point = point
        self.frame = frame


results = []
for game in games:
    scores = []
    for frame, score in enumerate(game.split()):
        for s in score:
            scores.append(Score(s, frame))

    for index, score in enumerate(scores):
        if score.point == '-':
            score.point = 0
        elif score.point == '/':
            bonus_point = int(scores[index + 1].point.replace('X', '10').replace('-', '0')) if score.frame < 9 else 0

            score.point = 10 - int(scores[index - 1].point) + bonus_point
        elif score.point == 'X':
            bonus_points = [score.point for score in scores[index + 1:index + 2 + 1]] if score.frame < 9 else []
            bonus_point = 0
            if '/' in bonus_points:
                bonus_point = 10
            else:
                bonus_point = sum([int(point.replace('X', '10').replace('-', '0')) for point in bonus_points])

            score.point = 10 + bonus_point
        else:
            score.point = int(score.point)

    score_dict = {}
    for score in scores:
        if score.frame not in score_dict:
            score_dict[score.frame] = 0

        score_dict[score.frame] += score.point

    sum_point = 0
    frame_sum_points = []
    for index in range(max(score_dict.keys()) + 1):
        sum_point += score_dict[index]
        frame_sum_points.append(sum_point)

    results.append(' '.join(map(str, frame_sum_points)))

# print("5 13 18 26 31 32 34 40 47 54")
for result in results:
    print(result)
