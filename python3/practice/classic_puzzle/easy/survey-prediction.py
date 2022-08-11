# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
answers = []
for i in range(n):
    answer = input()
    answers.append(answer)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)


class Answer:
    def __init__(self, age, gender, genre):
        self.age = age
        self.gender = gender
        self.genre = genre


temp_answers = []
for answer in answers:
    answer_elements = answer.split()
    if len(answer_elements) < 3:
        answer_elements.append(None)
    age, gender, genre = answer_elements
    age = int(age)

    temp_answers.append(Answer(age, gender, genre))
answers = temp_answers

train_answers = [answer for answer in answers if answer.genre is not None]
test_answers = [answer for answer in answers if answer.genre is None]

learning_model = {}
for answer in train_answers:
    age = answer.age
    gender = answer.gender
    genre = answer.genre

    if gender not in learning_model:
        learning_model[gender] = {}
    if genre not in learning_model[gender]:
        learning_model[gender][genre] = range(age, age + 1)

    age_range = learning_model[gender][genre]
    age_range_begin = min(min(age_range), age)
    age_range_end = max(max(age_range), age)
    learning_model[gender][genre] = range(age_range_begin, age_range_end + 1)

results = []
for answer in test_answers:
    age = answer.age
    gender = answer.gender

    predict = None
    if gender in learning_model:
        for k, v in learning_model[gender].items():
            if age in v:
                predict = k
                break
    results.append(predict)

# print("answer")
for result in results:
    print(result)
