# import sys
# import math

import re

import numpy as np

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
ms = []
for _ in range(n):
    m = input()
    ms.append(m)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class MonthBaseNumber:
    MONTHS = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    NUMS = [str(i) for i in range(10)] + ['A', 'B']

    @classmethod
    def to_i(cls, month_base_number):
        result = 0
        for index, month in enumerate(reversed(re.findall('.{1,3}', month_base_number))):
            base_number = len(cls.NUMS)**index
            digit = int(cls.NUMS[cls.MONTHS.index(month)], len(cls.NUMS))
            result += digit * base_number

        return result

    @classmethod
    def from_i(cls, num):
        result = ''
        for char in np.base_repr(num, len(cls.NUMS)):
            result += cls.MONTHS[cls.NUMS.index(char)]

        return result


month_base_number = sum(MonthBaseNumber.to_i(m) for m in ms)
result = MonthBaseNumber.from_i(month_base_number)

# print("answer")
print(result)
