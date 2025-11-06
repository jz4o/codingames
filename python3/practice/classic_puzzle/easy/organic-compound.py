# import sys
# import math

import re

# PREFIX IN ASCENDING ORDER:
# 'meth', 'eth', 'prop', 'but', 'pent', 'hex', 'hept', 'oct', 'non', 'dec'

formula = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Daterminor:
    def __init__(self, formula):
        self.formula = formula

        self.c_count = self.__count_atom('C')
        self.h_count = self.__count_atom('H')
        self.o_count = self.__count_atom('O')

    def chemical_name(self):
        prefix = self.__prefix_name()
        suffix = self.__suffix_name()

        return (
            f'{prefix}{suffix}'
            if all([prefix is not None, suffix is not None, self.__is_valid_c_count()])
            else 'OTHERS'
        )

    def __prefix_name(self):
        prefix_names = [None, 'meth', 'eth', 'prop', 'but', 'pent', 'hex', 'hept', 'oct', 'non', 'dec']

        return prefix_names[self.c_count]

    def __suffix_name(self):
        check_method_and_names = {
            self.__is_alkane: 'ane',
            self.__is_alkene: 'ene',
            self.__is_alcohol: 'anol',
            self.__is_carboxylic: 'anoic acid',
            self.__is_aldehide: 'anal',
            self.__is_ketone: 'anone',
        }

        for method, suffix in check_method_and_names.items():
            if method():
                return suffix

        return None

    def __is_alkane(self):
        return self.h_count == self.c_count * 2 + 2 and self.o_count == 0

    def __is_alkene(self):
        return self.h_count == self.c_count * 2 and self.o_count == 0

    def __is_alcohol(self):
        return self.formula.endswith('OH') and self.h_count == self.c_count * 2 + 2

    def __is_carboxylic(self):
        return self.formula.endswith('COOH') and self.h_count == self.c_count * 2

    def __is_aldehide(self):
        return self.formula.endswith('CHO') and self.h_count == self.c_count * 2

    def __is_ketone(self):
        return (
            len(re.findall('CO', self.formula)) == 1
            and not re.match(r'^CO|CO$', self.formula)
            and self.h_count == self.c_count * 2
        )

    def __is_valid_c_count(self):
        return self.o_count <= ''.join(re.findall(r'COOH|OH|CHO|CO', self.formula)).count('O')

    def __count_atom(self, atom):
        return sum(
            max(int(atom_match.removeprefix(atom) or '0'), 1)
            for atom_match
            in re.findall(fr'{atom}\d*', self.formula)
        )

daterminor = Daterminor(formula)
result = daterminor.chemical_name()

# print("organic compound name")
print(result)
