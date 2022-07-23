# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

_input = input()
states = input()
number_of_transitions = int(input())
transitions = []
for i in range(number_of_transitions):
    transition = input()
    transitions.append(transition)
start_state = input()
end_states = input()
number_of_words = int(input())
words = []
for i in range(number_of_words):
    word = input()
    words.append(word)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

state_list = states.split()
end_state_list = end_states.split()

transition_dict = {}
for state in state_list:
    transition_dict[state] = {}
for transition in transitions:
    from_state, char, to_state = transition.split()
    transition_dict[from_state][char] = to_state

results = []
for word in words:
    state = start_state
    for char in word:
        if state not in transition_dict or char not in transition_dict[state]:
            state = None
            break
        state = transition_dict[state][char]
    end_state = state

    result = str(end_state in end_state_list).lower()
    results.append(result)

# print("true or false")
for result in results:
    print(result)
