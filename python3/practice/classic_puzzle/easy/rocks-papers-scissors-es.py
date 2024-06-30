# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
a_list = []
for _ in range(n):
    a = input()
    a_list.append(a)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

RULE = {
    'Rock': {
        'beats': 'Scissors',
        'loses_to': 'Paper',
    },
    'Scissors': {
        'beats': 'Paper',
        'loses_to': 'Rock',
    },
    'Paper': {
        'beats': 'Rock',
        'loses_to': 'Scissors',
    },
}

double_a_list = a_list * 2
play_results = []
for index, a in enumerate(a_list):
    hand = RULE[a]['loses_to']

    target_a_list = double_a_list[index:index + n]
    loses_to = RULE[hand]['loses_to']
    lose_index = target_a_list.index(loses_to) if loses_to in target_a_list else len(target_a_list)

    win_count = len([a for a in target_a_list[:lose_index] if a == RULE[hand]['beats']])

    play_results.append({
        'hand': hand,
        'win_count': win_count,
        'start_index': index,
    })

play_results.sort(key=lambda play_result: (-play_result['win_count'], play_result['start_index']))

play_result = next(iter(play_results))

results = [
    play_result['hand'],
    play_result['start_index'],
]

# print("Rock")
# print("4")
for result in results:
    print(result)
