# import sys
# import math

import pandas as pd

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
rows = []
for _ in range(n):
    s = input()
    rows.append(s)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


def t(tag, element):
    return f'<{tag}>{element}</{tag}>'


results = []

results.append('<table>')

data_rows = []
for row in rows:
    is_sep = row.startswith('+')
    if len(data_rows) > 0 and data_rows[-1][0] is is_sep:
        data_rows[-1][-1].append(row)
    else:
        data_rows.append([is_sep, [row]])

data_rows = [row for is_sep, row in data_rows if not is_sep]

for cell_rows in data_rows:
    cells = [[cell.strip() for cell in row[1:-1].split('|')] for row in cell_rows]

    element = ''
    for cell in pd.DataFrame(cells).T.to_numpy():
        element += t('td', ' '.join(cell).strip())

    results.append(t('tr', element))

results.append('</table>')

# print("answer")
for result in results:
    print(result)
