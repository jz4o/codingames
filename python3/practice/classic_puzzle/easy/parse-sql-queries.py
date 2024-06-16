# import sys
# import math

import re

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

sql_query = input()
rows = int(input())
table_header = input()
table_rows = []
for _ in range(rows):
    table_row = input()

    table_rows.append(table_row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

columns = table_header.split(' ')
records = pd.DataFrame([dict(zip(columns, table_row.split(' '))) for table_row in table_rows])

sql_regexp = '(SELECT)\\s(.*)\\s(FROM)\\s(.*)'
if 'WHERE' in sql_query:
    sql_regexp += '\\s(WHERE)\\s(.*)'
if 'ORDER BY' in sql_query:
    sql_regexp += '\\s(ORDER BY)\\s(.*)'

matched = re.findall(sql_regexp, sql_query)[0]
query = {matched[index]: matched[index + 1] for index in range(0, len(matched), 2)}

if 'WHERE' in query:
    column, value = query['WHERE'].split(' = ')
    records = records[records[column] == value]

if 'ORDER BY' in query:
    column, direction = query['ORDER BY'].split(' ')

    if all(re.fullmatch('-?\\d+\\.?\\d*', value) for value in records[column]):
        records['for_sort'] = records[column].apply(float)
        records = records.sort_values('for_sort', ascending=direction == 'ASC')
    else:
        records = records.sort_values(column, ascending=direction == 'ASC')

if query['SELECT'] != '*':
    columns = query['SELECT'].split(', ')

results = []
results.append(' '.join(columns))
results.extend([' '.join(record_values) for record_values in records.loc[:, columns].to_numpy()])

# print("outputTableWithColumnTitlesNoRowIndexes")
for result in results:
    print(result)
