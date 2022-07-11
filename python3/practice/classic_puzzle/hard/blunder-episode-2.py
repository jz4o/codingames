# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
rooms = []
for i in range(n):
    room = input()
    rooms.append(room)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


def get_sum_money(room_dict, number):
    if room_dict[number]['sum_money']:
        return room_dict[number]['sum_money']

    prev_room_sum_moneys = []
    for prev_room_number in room_dict[number]['prev_rooms']:
        prev_room_sum_moneys.append(get_sum_money(room_dict, prev_room_number))

    # 0 when unreachable from room 0
    if len(prev_room_sum_moneys) > 0:
        room_dict[number]['sum_money'] = max(prev_room_sum_moneys) + room_dict[number]['money']
    else:
        room_dict[number]['sum_money'] = 0

    return room_dict[number]['sum_money']


room_dict = {}
for room in rooms:
    number, money, next_number1, next_number2 = room.split(' ')

    for room_number in [number, next_number1, next_number2]:
        if room_number not in room_dict:
            room_dict[room_number] = {'sum_money': None, 'money': None, 'prev_rooms': []}

    room_dict[number]['money'] = int(money)
    room_dict[next_number1]['prev_rooms'].append(number)
    room_dict[next_number2]['prev_rooms'].append(number)
room_dict['0']['sum_money'] = room_dict['0']['money']
room_dict['E']['money'] = 0

result = get_sum_money(room_dict, 'E')

# print("answer")
print(result)
