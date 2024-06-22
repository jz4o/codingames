# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

word = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

PERIODICS = [
  'H', 'He',  'Li', 'Be', 'B', 'C', 'N', 'O', 'F', 'Ne',
  'Na', 'Mg', 'Al', 'Si', 'P', 'S', 'Cl', 'Ar', 'K', 'Ca',
  'Sc', 'Ti', 'V', 'Cr', 'Mn', 'Fe', 'Co', 'Ni', 'Cu', 'Zn',
  'Ga', 'Ge', 'As', 'Se', 'Br', 'Kr', 'Rb', 'Sr', 'Y', 'Zr',
  'Nb', 'Mo', 'Tc', 'Ru', 'Rh', 'Pd', 'Ag', 'Cd', 'In', 'Sn',
  'Sb', 'Te', 'I', 'Xe', 'Cs', 'Ba', 'La', 'Ce', 'Pr', 'Nd',
  'Pm', 'Sm', 'Eu', 'Gd', 'Tb', 'Dy', 'Ho', 'Er', 'Tm', 'Yb',
  'Lu', 'Hf', 'Ta', 'W', 'Re', 'Os', 'Ir', 'Pt', 'Au', 'Hg',
  'Tl', 'Pb', 'Bi', 'Po', 'At', 'Rn', 'Fr', 'Ra', 'Ac', 'Th',
  'Pa', 'U', 'Np', 'Pu', 'Am', 'Cm', 'Bk', 'Cf', 'Es', 'Fm',
  'Md', 'No', 'Lr', 'Rf', 'Db', 'Sg', 'Bh', 'Hs', 'Mt', 'Ds',
  'Rg', 'Cn', 'Nh', 'Fl', 'Mc', 'Lv', 'Ts', 'Og',
]
LOWER_PERIODICS = [periodic.lower() for periodic in PERIODICS]

lower_word = word.lower()

periodics_list = [[]]
temp_results = []
while len(periodics_list) > 0:
    periodics = periodics_list.pop()

    joined_periodics = ''.join(periodics)
    if joined_periodics == lower_word:
        temp_results.append(periodics)
        continue

    remaining_word = lower_word.removeprefix(joined_periodics)
    next_periodics_list = [
        [*periodics, periodic]
        for periodic
        in LOWER_PERIODICS
        if remaining_word.startswith(periodic)
    ]

    periodics_list.extend(next_periodics_list)

results = [
    ''.join([PERIODICS[LOWER_PERIODICS.index(periodic)] for periodic in result_periodics])
    for result_periodics
    in temp_results
]
results.sort()

if len(results) == 0:
    results.append('none')

# print("spellings")
for result in results:
    print(result)
