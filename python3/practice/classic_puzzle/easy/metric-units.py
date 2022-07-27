# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

expression = input()  # the expression to calculate

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class MetricUnit:
    DIGIT_PRECISION = 5

    def __init__(self, value, unit):
        self.value = value
        self.unit = unit

    def convert_to_small_unit(self):
        convert_dict = {
            'km': {
                'small_unit': 'm',
                'rate': 1000
            },
            'm': {
                'small_unit': 'dm',
                'rate': 10
            },
            'dm': {
                'small_unit': 'cm',
                'rate': 10
            },
            'cm': {
                'small_unit': 'mm',
                'rate': 10
            },
            'mm': {
                'small_unit': 'um',
                'rate': 1000
            }
        }

        self.value = round(self.value * convert_dict[self.unit]['rate'], __class__.DIGIT_PRECISION)
        self.unit = convert_dict[self.unit]['small_unit']


UNITS = ['um', 'mm', 'cm', 'dm', 'm', 'km']

expression_elements = list(*re.findall(r'^([\d.]+)([a-z]+)\s\+\s([\d.]+)([a-z]+)', expression))
left_value, left_unit, right_value, right_unit = expression_elements
left_value = float(left_value)
right_value = float(right_value)

left_metric = MetricUnit(left_value, left_unit)
right_metric = MetricUnit(right_value, right_unit)

big_unit_metric = right_metric if UNITS.index(left_metric.unit) < UNITS.index(right_metric.unit) else left_metric
while left_metric.unit != right_metric.unit:
    big_unit_metric.convert_to_small_unit()

result_value = re.sub(r'\.0+$', '', str(left_metric.value + right_metric.value))

result = ''.join([result_value, left_metric.unit])

# print("1cm")
print(result)
