# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

pitch_rows = []
for _ in range(15):
    pitch_row = input()
    pitch_rows.append(pitch_row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Player:
    def __init__(self, y, x, team, is_active):
        self.y = y
        self.x = x
        self.team = team
        self.is_active = is_active

HALFWAY_LINE_X = 25

ball = next(iter(re.findall('o', ''.join(pitch_rows), re.IGNORECASE)))
ball_y = next(iter([index for index, pitch_row in enumerate(pitch_rows) if ball in pitch_row]))
ball_x = pitch_rows[ball_y].index(ball)

players = []
for row_index, pitch_row in enumerate(pitch_rows):
    for value_index, value in enumerate(pitch_row):
        if re.fullmatch('a|b', value, re.IGNORECASE) is None:
            continue

        team = value.lower()
        is_active = value == value.upper()

        player = Player(row_index, value_index, team, is_active)
        players.append(player)

a_players = sorted([player for player in players if player.team == 'a'], key=lambda player: player.x)
b_players = sorted([player for player in players if player.team == 'b'], key=lambda player: player.x)

offside_position_players = None
if ball_y in [0, 14]:
    offside_position_players = []
elif ball == 'o':
    second_b_player_x = b_players[1].x

    border = min(HALFWAY_LINE_X, ball_x, second_b_player_x)
    offside_position_players = [player for player in a_players if player.x < border]
else:
    second_a_player_x = a_players[-2].x

    border = max(HALFWAY_LINE_X, ball_x, second_a_player_x)
    offside_position_players = [player for player in b_players if player.x > border]
offside_players = [player for player in offside_position_players if player.is_active]

offside_position_players_result = None
if len(offside_position_players) == 0:
    offside_position_players_result = 'No player in an offside position.'
else:
    offside_position_players_result = f'{len(offside_position_players)} player(s) in an offside position.'

offside_result = 'ONSIDE!' if len(offside_players) == 0 else 'OFFSIDE!'
offside_players_result = f'VAR: {offside_result}'

results = [
    offside_position_players_result,
    offside_players_result,
]

# print("Offside Positions")
# print("write VAR Decision")
for result in results:
    print(result)
