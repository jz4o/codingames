# import sys
# import math

from collections import defaultdict

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

t = input()
d = int(input())
l = int(input())
s = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

markov_chain = defaultdict(list)
t_words = t.split()
for i in range(len(t_words) - d):
    words = t_words[i:i + d + 1]

    markov_value = words.pop()
    markov_key = ' '.join(words)

    markov_chain[markov_key].append(markov_value)

random_seed = 0
s_words = s.split()
for _ in range(l - len(s_words)):
    random_seed += 7

    markov_key = ' '.join(s_words[-d:])
    markov_values = markov_chain[markov_key]

    next_word = markov_values[random_seed % len(markov_values)]

    s_words.append(next_word)

result = ' '.join(s_words)

# print("fish is bad and")
print(result)
