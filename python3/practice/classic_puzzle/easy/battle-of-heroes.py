# import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

stack_1data = input()
stack_2data = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class Stack:
    def __init__(self, name, amount, health, damage):
        self.name = name
        self.amount = amount
        self.health = health
        self.damage = damage
        self.surplus_damage = 0


def combat(attack, defense):
    damage = attack.damage * attack.amount
    perish = min(math.floor((damage + defense.surplus_damage) / defense.health), defense.amount)
    surplus_damage = (damage + defense.surplus_damage) % defense.health

    log = [
        f'{attack.amount} {attack.name}(s) attack(s) {defense.amount} {defense.name}(s) dealing {damage} damage',
        f'{perish} unit(s) perish'
    ]
    defense.amount -= perish
    defense.surplus_damage = surplus_damage

    return log


stack1_name, stack1_amount_str, stack1_health_str, stack1_damage_str = stack_1data.split(';')
stack1_amount = int(stack1_amount_str)
stack1_health = int(stack1_health_str)
stack1_damage = int(stack1_damage_str)
stack1 = Stack(stack1_name, stack1_amount, stack1_health, stack1_damage)

stack2_name, stack2_amount_str, stack2_health_str, stack2_damage_str = stack_2data.split(';')
stack2_amount = int(stack2_amount_str)
stack2_health = int(stack2_health_str)
stack2_damage = int(stack2_damage_str)
stack2 = Stack(stack2_name, stack2_amount, stack2_health, stack2_damage)

round_count = 0
results = []
while 0 < stack1.amount:
    round_count += 1
    results.append(f'Round {round_count}')

    results.extend(combat(stack1, stack2))
    results.append('----------')
    if stack2.amount == 0:
        break

    results.extend(combat(stack2, stack1))
    results.append('##########')

winner = stack2 if stack1.amount == 0 else stack1
results.append(f'{winner.name} won! {winner.amount} unit(s) left')

# print("Victory!")
for result in results:
    print(result)
