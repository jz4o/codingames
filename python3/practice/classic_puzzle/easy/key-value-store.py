# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
ss = []
for _ in range(n):
    s = input()

    ss.append(s)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

key_value_store = {}
results = []
for s in ss:
    command, *command_values = s.split(' ')

    if command == 'SET':
        for key_value in command_values:
            key, value = key_value.split('=')
            key_value_store[key] = value

    elif command == 'GET':
        result = ' '.join(key_value_store.get(key, 'null') for key in command_values)
        results.append(result)

    elif command == 'EXISTS':
        result = ' '.join(str(key in key_value_store).lower() for key in command_values)
        results.append(result)

    elif command == 'KEYS':
        result = 'EMPTY' if len(key_value_store) == 0 else ' '.join(key_value_store.keys())
        results.append(result)

# print("value1 value2 value3")
for result in results:
    print(result)
