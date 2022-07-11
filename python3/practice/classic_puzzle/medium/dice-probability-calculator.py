# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

expr = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


def calc(expr):
    while '(' in expr:
        bracket_expr = next(re.finditer(r'\(.*?\)', expr)).group()
        answer = calc(bracket_expr[1:-1])

        expr = expr.replace(bracket_expr, str(answer))

    expr = expr.replace("*", " * ")
    expr = expr.replace("+", " + ")
    expr = expr.replace("-", " - ")
    expr = expr.replace(">", " > ")
    expr_elements = expr.split(" ")

    exec_operation = {
        '*': lambda a, b: int(a) * int(b),
        '+': lambda a, b: int(a) + int(b),
        '-': lambda a, b: int(a) - int(b),
        '>': lambda a, b: 1 if int(a) > int(b) else 0
    }

    for operation in '*+->':
        while operation in expr_elements:
            index = expr_elements.index(operation)
            left, _, right = expr_elements[index - 1:index + 2]
            answer = exec_operation[operation](left, right)
            expr_elements[index - 1:index + 2] = [str(answer)]

    return int(expr_elements[0])


incomplete_exprs = [expr]
exprs = []
while len(incomplete_exprs) > 0:
    incomplete_expr = incomplete_exprs.pop()

    if 'd' not in incomplete_expr:
        exprs.append(incomplete_expr)
        continue

    dice = next(re.finditer(r'd\d', incomplete_expr)).group()
    front, back = incomplete_expr.split(dice, 1)

    dice_number = int(dice[1:])
    for i in range(1, dice_number + 1):
        incomplete_exprs.append(f'{front}{i}{back}')

answers = []
for expr in exprs:
    answers.append(calc(expr))

uniq_answers = sorted(list(set(answers)))

results = []
for answer in uniq_answers:
    count = answers.count(answer)

    percentage = count / len(answers) * 100
    formatted_percentage = '{:.2f}'.format(percentage)

    results.append(f'{answer} {formatted_percentage}')

# print("answer")
for result in results:
    print(result)
