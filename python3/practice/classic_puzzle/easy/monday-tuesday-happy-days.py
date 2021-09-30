import sys
import math

import datetime

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

leap_year = int(input())
inputs = input().split()
source_day_of_week = inputs[0]
source_month = inputs[1]
source_day_of_month = int(inputs[2])
inputs = input().split()
target_month = inputs[0]
target_day_of_month = int(inputs[1])

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

MONTHS = [None, 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
DAY_OF_WEEK = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']

year = 2000 if leap_year == 1 else 1999
target_date = datetime.date(year, MONTHS.index(target_month), target_day_of_month)
source_date = datetime.date(year, MONTHS.index(source_month), source_day_of_month)

days = (target_date - source_date).days
source_day_of_week_index = DAY_OF_WEEK.index(source_day_of_week)
target_day_of_week_index = (days + source_day_of_week_index) % len(DAY_OF_WEEK)

# print("day of week")
print(DAY_OF_WEEK[target_day_of_week_index])
