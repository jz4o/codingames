# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
fnames = []
for _ in range(n):
    fname = input()
    fnames.append(fname)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Keyword:
    def __init__(self, row_index, column_index):
        self.row_index = row_index
        self.column_index = column_index

class Function:
    def __init__(self, begin_row_index, end_row_index):
        self.begin_row_index = begin_row_index
        self.end_row_index = end_row_index

temp_fnames = [*fnames]

inserts = []
semicolons = []
begin_row_indexes = []
end_row_indexes = []
for index, fname in enumerate(temp_fnames):
    lower_fname = fname.lower()

    comment_index = lower_fname.index('--') if '--' in lower_fname else len(lower_fname)

    insert_search_pos = 0
    while re.search(fr'.{{{insert_search_pos},}}?(^|;|\s)(insert)\s', lower_fname) is not None:
        insert_match = re.search(fr'.{{{insert_search_pos},}}?(^|;|\s)(insert)\s', lower_fname)

        match_index, insert_search_pos = insert_match.span(2)
        if comment_index <= match_index:
            break

        inserts.append(Keyword(index, match_index))

    semicolon_search_pos = 0
    while re.search(fr'.{{{semicolon_search_pos},}}?(;)', lower_fname) is not None:
        semicolon_match = re.search(fr'.{{{semicolon_search_pos},}}?(;)', lower_fname)

        match_index, semicolon_search_pos = semicolon_match.span(1)
        if comment_index <= match_index:
            break

        semicolons.append(Keyword(index, match_index))

    if lower_fname.startswith('begin'):
        begin_row_indexes.append(index)
    if lower_fname.startswith('end'):
        end_row_indexes.append(index)

functions = [
    Function(begin_row_index, end_row_index)
    for begin_row_index, end_row_index
    in zip(begin_row_indexes, end_row_indexes, strict=True)
]

for insert in reversed(inserts):
    if any(function.begin_row_index <= insert.row_index <= function.end_row_index for function in functions):
        continue

    semicolon = next(iter(
        semicolon
        for semicolon in semicolons
        if (
            (insert.row_index == semicolon.row_index and insert.column_index < semicolon.column_index)
            or insert.row_index < semicolon.row_index
        )
    ))

    if insert.row_index == semicolon.row_index:
        fname = temp_fnames[insert.row_index]
        temp_fnames[insert.row_index] = f'{fname[:insert.column_index]}{fname[semicolon.column_index + 1:]}'
    else:
        temp_fnames[semicolon.row_index] = temp_fnames[semicolon.row_index][semicolon.column_index + 1:]
        if len(temp_fnames[semicolon.row_index]) == 0:
            temp_fnames.pop(semicolon.row_index)

        comments = [
            re.search(r'--.*$', fname).group()
            for fname
            in temp_fnames[insert.row_index + 1:semicolon.row_index]
            if re.search(r'--.*$', fname) is not None
        ]
        temp_fnames[insert.row_index + 1:semicolon.row_index] = comments

        before_insert_statement = temp_fnames[insert.row_index][:insert.column_index]
        insert_row_comment = re.search(r'--.*$', temp_fnames[insert.row_index][insert.column_index:])
        comment = insert_row_comment.group() if insert_row_comment is not None else ''
        temp_fnames[insert.row_index] = f'{before_insert_statement}{comment}'

    if len(temp_fnames[insert.row_index]) == 0:
        temp_fnames.pop(insert.row_index)

results = temp_fnames

# print("answer")
for result in results:
    print(result)
