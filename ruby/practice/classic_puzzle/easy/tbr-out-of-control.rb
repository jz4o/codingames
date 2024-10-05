# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

b = gets.to_i
titles = []
b.times do
  title = gets.chomp
  titles << title
end
n = gets.to_i
names = []
n.times do
  name = gets.chomp
  names << name
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class Shelf
  def initialize(size)
    @book_names = []
    @size = size
  end

  def add_books(book_names, force: false)
    add_book_names = book_names - @book_names
    return false if !force && @size < @book_names.size + add_book_names.size

    @book_names.concat(add_book_names)

    true
  end

  def books
    @book_names.sort
  end

  def under_control?
    @book_names.size <= @size
  end
end

def get_rank_book_names(books, rank)
  books.filter_map { |book| book.delete_suffix " #{rank}" if book.end_with? " #{rank}" }
end

ranked_book_names = 10.downto(0).filter_map do |rank|
  rank_book_names = get_rank_book_names(names, rank)
  rank_book_names if rank_book_names.any?
end

shelf = Shelf.new n
shelf.add_books(titles, force: true)
shelf.add_books(get_rank_book_names(names, 'None'), force: true)
shelf.add_books(ranked_book_names.shift || [], force: true)
nil while shelf.add_books(ranked_book_names.shift || [])

results = shelf.under_control? ? shelf.books : ['Your TBR is out of control Clara!']

# puts "Your TBR is out of control Clara!"
results.each do |result|
  puts result
end
