import sys
import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())  # Number of elements which make up the association table.
q = int(input())  # Number Q of file names to be analyzed.
exts = []
mts = []
for i in range(n):
    # ext: file extension
    # mt: MIME type.
    ext, mt = input().split()

    exts.append(ext.lower())
    mts.append(mt)
fnames = []
for i in range(q):
    fname = input()  # One file name per line.
    fnames.append(fname)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

results = []
for fname in fnames:
    fname_elements = [e.replace('.', '').lower() for e in re.findall('\\.[^\\.]*?$', fname)]
    ext = fname_elements[-1] if len(fname_elements) > 0 else 'UNKNOWN'

    if ext in exts:
        i = exts.index(ext)
        results.append(mts[i])
    else:
        results.append('UNKNOWN')

# For each of the Q filenames, display on a line the corresponding MIME type. If there is no corresponding type, then display UNKNOWN.
# print("UNKNOWN")
for result in results:
    print(result)
