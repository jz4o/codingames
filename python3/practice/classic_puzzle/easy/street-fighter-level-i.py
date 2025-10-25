# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

champion_1, champion_2 = input().split()
n = int(input())
input_rows = []
for _ in range(n):
    d, attack = input().split()
    input_rows.append((d, attack))

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Champion:
    def __init__(self, name, life, punch, kick):
        self.name = name
        self.initial_life = life
        self.life = life
        self.punch = punch
        self.kick = kick

        self.hit = 0
        self.rage = 0

    def special(self, _opp):
        print('not implement')

    def attack(self, attack_type, opp):
        attack_attr = getattr(self, attack_type.lower())
        damage = attack_attr(opp) if callable(attack_attr) else attack_attr

        opp.life -= damage
        opp.rage += 1

        self.hit += 1

class Ken(Champion):
    def __init__(self):
        super().__init__('KEN', 25, 6, 5)

    def special(self, _opp):
        damage = self.rage * 3
        self.rage = 0

        return damage

class Ryu(Champion):
    def __init__(self):
        super().__init__('RYU', 25, 4, 5)

    def special(self, _opp):
        damage = self.rage * 4
        self.rage = 0

        return damage

class Tank(Champion):
    def __init__(self):
        super().__init__('TANK', 50, 2, 2)

    def special(self, _opp):
        damage = self.rage * 2
        self.rage = 0

        return damage

class Vlad(Champion):
    def __init__(self):
        super().__init__('VLAD', 30, 3, 3)

    def special(self, opp):
        damage = (self.rage + opp.rage) * 2
        self.rage = 0

        return damage

class Jade(Champion):
    def __init__(self):
        super().__init__('JADE', 20, 2, 7)

    def special(self, _opp):
        damage = self.hit * self.rage
        self.rage = 0

        return damage

class Anna(Champion):
    def __init__(self):
        super().__init__('ANNA', 18, 9, 1)

    def special(self, _opp):
        damage = (self.initial_life - self.life) * self.rage
        self.rage = 0

        return damage

class Jun(Champion):
    def __init__(self):
        super().__init__('JUN', 60, 2, 1)

    def special(self, _opp):
        self.life += self.rage
        damage = self.rage
        self.rage = 0

        return damage

champion_classes = [Ken, Ryu, Tank, Vlad, Jade, Anna, Jun]

c1 = next(iter([champion for champion in champion_classes if champion.__name__.lower() == champion_1.lower()]))()
c2 = next(iter([champion for champion in champion_classes if champion.__name__.lower() == champion_2.lower()]))()

for d, attack in input_rows:
    if d == '<':
        c2.attack(attack, c1)
    else:
        c1.attack(attack, c2)

    if c1.life <= 0 or c2.life <= 0:
        break

winner, loser = [c2, c1] if c1.life < c2.life else [c1, c2]

result = f'{winner.name} beats {loser.name} in {winner.hit} hits'

# print("[winner] beats [loser] in [n] hits")
print(result)
