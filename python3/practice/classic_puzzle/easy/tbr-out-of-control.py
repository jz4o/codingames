# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

b = int(input())
titles = []
for _ in range(b):
    title = input()
    titles.append(title)
n = int(input())
names = []
for _ in range(n):
    name = input()
    names.append(name)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Bookshelf:
    def __init__(self, size):
        self.book_names = set()
        self.size = size

    def add_books(self, book_names, *, force=False):
        add_book_names = set(book_names) - self.book_names
        if not force and self.size < len(self.book_names) + len(add_book_names):
            return None

        self.book_names |= add_book_names

        return self.book_names

    def books(self):
        return sorted(self.book_names)

    def is_under_control(self):
        return len(self.book_names) <= self.size

def get_rank_book_names(books, rank):
    return [
        book.removesuffix(f' {rank}')
        for book
        in books
        if book.endswith(f' {rank}')
    ]

ranked_book_names = []
for rank in reversed(range(10)):
    rank_book_names = get_rank_book_names(names, rank)
    if len(rank_book_names) > 0:
        ranked_book_names.append(rank_book_names)

bookshelf = Bookshelf(n)
bookshelf.add_books(titles, force=True)
bookshelf.add_books(get_rank_book_names(names, 'None'), force=True)
if len(ranked_book_names) > 0:
    bookshelf.add_books(ranked_book_names.pop(0), force=True)
while len(ranked_book_names) > 0 and bookshelf.add_books(ranked_book_names.pop(0)) is not None:
    pass

results = bookshelf.books() if bookshelf.is_under_control() else ['Your TBR is out of control Clara!']

# print("Your TBR is out of control Clara!")
for result in results:
    print(result)
