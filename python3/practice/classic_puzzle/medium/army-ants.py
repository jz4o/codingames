# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n1, n2 = [int(i) for i in input().split()]
s1 = input()
s2 = input()
t = int(input())

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

s1_move_part = list(reversed(s1[0:t]))
s2_move_part = list(s2[0:t])

for i in range(t - len(s1_move_part)):
    s1_move_part.insert(0, '')
for i in range(t - len(s2_move_part)):
    s2_move_part.append('')

s1_not_move_part = list(reversed(s1[t:]))
s2_not_move_part = list(s2[t:])

s_moved_part = sum([list(t) for t in zip(s2_move_part, s1_move_part)], [])

result = ''.join([*s1_not_move_part, *s_moved_part, *s2_not_move_part])

# print("answer")
print(result)
