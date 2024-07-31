# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
comments = []
for _ in range(n):
    comment = input()
    comments.append(comment)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Comment:
    def __init__(self, comment_str, index):
        user_name, date, likes, priority = comment_str.split('|')

        self.origin = comment_str
        self.user_name = user_name
        self.date = int(date.replace(':', ''))
        self.likes = int(likes)
        self.priority = ['Pinned', 'Followed', 'none'].index(priority)
        self.index = index
        self.parent_index = None

    @staticmethod
    def sort(comments):
        return sorted(comments, key=lambda comment: [comment.priority, -comment.likes, -comment.date, comment.index])

all_comments = [Comment(comment, index) for index, comment in enumerate(comments)]

parent_index = None
for comment in all_comments:
    if comment.user_name.startswith(' ' * 4):
        comment.parent_index = parent_index
    else:
        parent_index = comment.index

origin_comments = [comment for comment in all_comments if comment.parent_index is None]
reply_comments = list(set(all_comments) - set(origin_comments))

sorted_comments = []
sorted_comments.extend(Comment.sort(origin_comments))

parent_indexes = sorted({comment.parent_index for comment in reply_comments})
for parent_index in parent_indexes:
    parent_comment_index = next(iter([
        index
        for index, comment
        in enumerate(sorted_comments)
        if comment.index == parent_index
    ]))

    target_reply_comments = [comment for comment in reply_comments if comment.parent_index == parent_index]

    sorted_comments = [
        *sorted_comments[:parent_comment_index + 1],
        *Comment.sort(target_reply_comments),
        *sorted_comments[parent_comment_index + 1:],
    ]

results = [comment.origin for comment in sorted_comments]

# print("answer")
for result in results:
    print(result)
