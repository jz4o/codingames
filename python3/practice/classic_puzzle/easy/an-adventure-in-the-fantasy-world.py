# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

s = input()
n = int(input())
ms = []
for i in range(n):
    m = input()
    ms.append(m)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class Warrior:
    def __init__(self, y, x, money):
        self.y = y
        self.x = x
        self.money = money


class Enemy:
    def __init__(self, y, x, name):
        self.y = y
        self.x = x
        self.name = name


class Money:
    def __init__(self, y, x, value):
        self.y = y
        self.x = x
        self.value = value


warrior = Warrior(0, 0, 50)

units = []
for m in ms:
    [str_y, str_x, unit_type, value] = m.split(' ')
    y = int(str_y)
    x = int(str_x)

    if unit_type == 'enemy':
        units.append(Enemy(y, x, value))
    elif unit_type == 'money':
        units.append(Money(y, x, int(value.replace('G', ''))))

result = ''
for direction in list(s):
    if direction == 'R':
        warrior.x += 1
    elif direction == 'L':
        warrior.x -= 1
    elif direction == 'U':
        warrior.y -= 1
    elif direction == 'D':
        warrior.y += 1

    unit = next((unit for unit in units if unit.y == warrior.y and unit.x == warrior.x), None)
    if unit is None:
        continue

    if isinstance(unit, Enemy):
        # avoid a fight
        if unit.name == 'goblin' and warrior.money >= 50:
            warrior.money -= 50
            continue

        result = f'{warrior.y} {warrior.x} {warrior.money}G {unit.name}'

        break
    elif isinstance(unit, Money):
        warrior.money += unit.value
        units.remove(unit)

result = result or f'GameClear {warrior.y} {warrior.x} {warrior.money}G'

# print("result")
print(result)
