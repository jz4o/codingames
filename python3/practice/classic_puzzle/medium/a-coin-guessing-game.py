# import sys
# import math

from itertools import combinations

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n, t = (int(i) for i in input().split())
cs = []
for _ in range(t):
    for j in input().split():
        c = int(j)
        cs.append(c)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

def each_slice(target_list: list, n: int):
    return [target_list[i:i + n] for i in range(0, len(target_list), n)]

odd_numbers = range(1, n * 2 + 1, 2)
even_numbers = range(2, n * 2 + 1, 2)

guess_dict = {
    i: list(odd_numbers if i % 2 == 0 else even_numbers)
    for i
    in range(1, n * 2 + 1)
}

for coin_pair in each_slice(cs, n):
    for (a, b) in combinations(coin_pair, 2):
        if b in guess_dict[a]:
            guess_dict[a].remove(b)
        if a in guess_dict[b]:
            guess_dict[b].remove(a)

pending_keys = set(guess_dict.keys())
while len(pending_keys) > 0:
    fix_pairs = {k: next(iter(v)) for k, v in guess_dict.items() if len(v) == 1}
    for k, v in fix_pairs.items():
        guess_dict[v] = [k]
        for dk in set(guess_dict.keys()) - {v}:
            if k in guess_dict[dk]:
                guess_dict[dk].remove(k)
        for dk in set(guess_dict.keys()) - {k}:
            if v in guess_dict[dk]:
                guess_dict[dk].remove(v)

    pending_keys -= set(fix_pairs.keys())

result = ' '.join(str(next(iter(guess_dict[i]))) for i in odd_numbers)

# print("2 4 6...")
print(result)
