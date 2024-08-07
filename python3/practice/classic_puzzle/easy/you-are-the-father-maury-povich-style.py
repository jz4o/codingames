# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

mother = input()
child = input()
num_of_possible_fathers = int(input())
a_possible_fathers = []
for _ in range(num_of_possible_fathers):
    a_possible_father = input()
    a_possible_fathers.append(a_possible_father)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

mother_chrom_pairs = mother.split(':', maxsplit=1)[-1].strip().split()
child_chrom_pairs = child.split(':', maxsplit=1)[-1].strip().split()

father_chrom_parts = []
for mother_chrom_pair, child_chrom_pair in zip(mother_chrom_pairs, child_chrom_pairs):
    father_chrom_part = list(set(child_chrom_pair) - set(mother_chrom_pair))
    if len(father_chrom_part) == 0:
        father_chrom_parts.append(child_chrom_pair)
    else:
        father_chrom_parts.append(father_chrom_part)

father = None
for a_possible_father in a_possible_fathers:
    a_possible_father_chrom_pairs = a_possible_father.split(':', maxsplit=1)[-1].strip().split()

    is_father_check = []
    for a_possible_father_chrom_pair, father_chrom_part in zip(a_possible_father_chrom_pairs, father_chrom_parts):
        if len(father_chrom_part) == 1:
            is_father_check.append(next(iter(father_chrom_part)) in a_possible_father_chrom_pair)
        else:
            is_father_check.append(len(set(father_chrom_part) - set(a_possible_father_chrom_pair)) < 2)

    if all(is_father_check):
        father = a_possible_father
        break

father_name = next(iter(father.split(':', maxsplit=1)))

result = f'{father_name}, you are the father!'

# print("what Maury Povich might say")
print(result)
