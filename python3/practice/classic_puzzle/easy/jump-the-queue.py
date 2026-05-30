# import sys
# import math

from dataclasses import dataclass

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

g, e = [int(i) for i in input().split()]
groups = []
for _ in range(g):
    group = input()
    groups.append(group)
events = []
for i in input().split():
    event = int(i)
    events.append(event)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

@dataclass
class Student:
    id: int
    group_id: int | None

DEQUEUEING_EVENT = -1

groups = [group.split(' ') for group in groups]

student_queue = []
leaved_students = []
for event in events:
    if event == DEQUEUEING_EVENT:
        leaved_students.append(student_queue.pop(0))
        continue

    student_id = event
    group_id = next(iter(index for index, group in enumerate(groups) if str(student_id) in group), None)
    student = Student(student_id, group_id)

    insert_index = (
        next(reversed([index for index, s in enumerate(student_queue) if s.group_id == group_id]), None)
        if group_id is not None
        else None
    )
    if insert_index is not None:
        student_queue.insert(insert_index + 1, student)
    else:
        student_queue.append(student)

results = [student.id for student in leaved_students]

# print("answer")
for result in results:
    print(result)
