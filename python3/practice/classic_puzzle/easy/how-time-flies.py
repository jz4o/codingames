import sys
import math

import datetime

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

begin = input()
end = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

begin_date = datetime.datetime.strptime(begin, '%d.%m.%Y')
end_date = datetime.datetime.strptime(end, '%d.%m.%Y')

begin_months = begin_date.year * 12 + begin_date.month
end_months = end_date.year * 12 + end_date.month
year, month = divmod(end_months - begin_months, 12)
if end_date.day < begin_date.day:
    month -= 1
days = (end_date - begin_date).days

formated_year = ''
if year != 0:
    formated_year = f'{year} year'
    if year > 1:
        formated_year += 's'

formated_month = ''
if month != 0:
    formated_month = f'{month} month'
    if month > 1:
        formated_month += 's'

formated_days = f'total {days} days'

result = [formated_year, formated_month, formated_days]
result = ', '.join([r for r in result if r])

# print("YY year[s], MM month[s], total NN days")
print(result)
