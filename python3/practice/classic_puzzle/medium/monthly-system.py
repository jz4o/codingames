import sys
import math

import numpy as np
import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
ms = []
for i in range(n):
    m = input()
    ms.append(m)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class MonthBaseNumber:
    MONTHS = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    NUMS = [str(i) for i in range(10)] + ['A', 'B']

    @classmethod
    def to_i(self, month_base_number):
        result = 0
        for index, month in enumerate(reversed(re.findall('.{1,3}', month_base_number))):
            base_number = len(self.NUMS)**index
            digit = int(self.NUMS[self.MONTHS.index(month)], len(self.NUMS))
            result += digit * base_number

        return result

    @classmethod
    def from_i(self, num):
        result = ''
        for char in np.base_repr(num, len(self.NUMS)):
            result += self.MONTHS[self.NUMS.index(char)]

        return result

month_base_number = sum(map(lambda m: MonthBaseNumber.to_i(m), ms))
result = MonthBaseNumber.from_i(month_base_number)

# print("answer")
print(result)
