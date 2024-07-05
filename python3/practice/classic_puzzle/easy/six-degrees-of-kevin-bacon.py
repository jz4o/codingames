# import sys
# import math

import itertools

# 6 Degrees of Kevin Bacon!

actor_name = input()
n = int(input())
movie_casts = []
for _ in range(n):
    movie_cast = input()
    movie_casts.append(movie_cast)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

kevin = 'Kevin Bacon'

casts_list = []
for movie_cast in movie_casts:
    _movie_name, movie_casts = movie_cast.split(': ', 1)
    casts_list.append(movie_casts.split(', '))

target_casts = [actor_name]
bacon_number = 0
while kevin not in target_casts:
    bacon_number += 1

    next_target_casts = itertools.chain.from_iterable([
        casts
        for casts
        in casts_list
        if any(target in casts for target in target_casts)
    ])

    target_casts = list(set(next_target_casts))

result = bacon_number

# print("N degrees to Kevin Bacon")
print(result)
