# import sys
# import math

from collections import defaultdict

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
k = int(input())
strs = []
for _ in range(k):
    _str = input()
    strs.append(_str)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

pre_processes_dict: dict[int, list[int]] = defaultdict(list)
for _str in strs:
    pre_process, process = [int(char) for char in _str.split('<')]
    pre_processes_dict[process] = [*pre_processes_dict[process], pre_process]

def is_circular_references(pre_process_dict: dict[int, list[int]]):
    be_check_lists: list[list[int]] = [[key] for key in pre_process_dict]
    while len(be_check_lists) > 0:
        be_check_list = be_check_lists.pop()

        last_process = be_check_list[-1]
        pre_processes = pre_process_dict[last_process]
        for pre_process in pre_processes:
            if pre_process in be_check_list:
                return True

            be_check_lists.append([*be_check_list, pre_process])

    return False

result = None
if is_circular_references(pre_processes_dict):
    result = 'INVALID'
else:
    processes = list(range(1, n + 1))
    ordered_processes = []
    while len(processes) > 0:
        process = next(iter(process for process in processes if len(pre_processes_dict[process]) == 0), None)
        if process is None:
            break

        for key, value in pre_processes_dict.items():
            pre_processes_dict[key] = [v for v in value if v != process]

        ordered_processes.append(process)
        processes.remove(process)

    result = ' '.join(str(process) for process in ordered_processes)

# print("answer")
print(result)
