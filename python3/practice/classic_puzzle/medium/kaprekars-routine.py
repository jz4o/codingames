# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n_1 = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

digits_size = len(n_1)
answers = []

temp = n_1
while temp not in answers:
    answers.append(temp)

    biggest = int(''.join(sorted(temp, reverse=True)))
    smallest = int(''.join(sorted(temp)))

    answer = biggest - smallest

    temp = str(answer).zfill(digits_size)

begin_index = answers.index(temp)
result = ' '.join(answers[begin_index:])

# print("1 2 3 4")
print(result)
