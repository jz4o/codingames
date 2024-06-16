# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.


class Voter:
    def __init__(self, name, vote_count):
        self.name = name
        self.vote_count = vote_count


n = int(input())
m = int(input())
voters = []
for _ in range(n):
    inputs = input().split()
    person_name = inputs[0]
    nb_vote = int(inputs[1])

    voters.append(Voter(person_name, nb_vote))

votes = {}
for _ in range(m):
    voter_name, vote_value = input().split()

    if voter_name not in votes:
        votes[voter_name] = []
    votes[voter_name].append(vote_value)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

yes = 0
no = 0
for voter in voters:
    if voter.name not in votes or voter.vote_count < len(votes[voter.name]):
        continue

    yes += len(list(filter(lambda vote: vote == 'Yes', votes[voter.name])))
    no += len(list(filter(lambda vote: vote == 'No', votes[voter.name])))

# print("output")
print(f'{yes} {no}')
