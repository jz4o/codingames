# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
players = []
for _ in range(n):
    player = input()
    players.append(player)
player_shoots = []
for _ in range(n):
    shoots = input()
    player_shoots.append(shoots)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

TARGET_POINT = 101
MISS_SHOOT = 'X'

reached_rounds = {}
for player, shoots in zip(players, player_shoots, strict=True):
    point = 0
    game_round = 0
    shoots_list = shoots.split()
    while len(shoots_list) > 0:
        game_round += 1

        temp_point = 0
        temp_shoots = []
        for _ in range(3):
            if len(shoots_list) == 0:
                break

            shoot = shoots_list.pop(0)

            shoot_point = 0
            if '*' in shoot:
                shoot_elements = [int(i) for i in shoot.split('*')]
                shoot_point = shoot_elements[0] * shoot_elements[-1]
            elif shoot == MISS_SHOOT:
                shoot_point = -30 if len(temp_shoots) > 0 and temp_shoots[-1] == MISS_SHOOT else -20
            else:
                shoot_point = int(shoot)

            temp_point += shoot_point

            temp_shoots.append(shoot)

            if point + temp_point >= TARGET_POINT:
                break

        if all(temp_shoot == MISS_SHOOT for temp_shoot in temp_shoots):
            point = 0
        elif point + temp_point <= TARGET_POINT:
            point += temp_point

    if point == TARGET_POINT:
        reached_rounds[player] = game_round

min_round = min(reached_rounds.values())
result = next(iter([player for player, game_round in reached_rounds.items() if game_round == min_round]))

# print("winner")
print(result)
