# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

color = gets.chomp
lines = []
8.times do
  line = gets.chomp
  lines << line
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

EMPTY = '.'.freeze
QUEEN = 'Q'.freeze

def count_controlled_square(board, queen_y, queen_x, queen_color)
  height = board.size
  width = board.first.size

  bottom_square_size = height - queen_y - 1
  right_square_size = width - queen_x - 1

  top_squares = (0...queen_y).map { |i| board[i][queen_x] }.reverse
  top_right_squares = (1..[queen_y, right_square_size].min).map { |i| board[queen_y - i][queen_x + i] }
  right_squares = board[queen_y][(queen_x + 1)..]
  bottom_right_squares = (1..[bottom_square_size, right_square_size].min).map { |i| board[queen_y + i][queen_x + i] }
  bottom_squares = board[(queen_y + 1)..].map { |row| row[queen_x] }
  bottom_left_squares = (1..[bottom_square_size, queen_x].min).map { |i| board[queen_y + i][queen_x - i] }
  left_squares = board[queen_y][...queen_x].reverse
  top_left_squares = (1..[queen_y, queen_x].min).map { |i| board[queen_y - i][queen_x - i] }

  square_lines = [
    top_squares,
    top_right_squares,
    right_squares,
    bottom_right_squares,
    bottom_squares,
    bottom_left_squares,
    left_squares,
    top_left_squares
  ]

  square_lines.sum { |square_line| count_line_controlled_square square_line, queen_color }
end

def count_line_controlled_square(squares, queen_color)
  piece_index = squares.index { |square| square != EMPTY }
  piece_index + (squares[piece_index] == queen_color ? 0 : 1)
end

board = lines.map { |line| "#{color.chr}#{line}#{color.chr}".chars }
board.unshift [color.chr] * 10
board.push [color.chr] * 10

queen_y = board.index { |row| row.include? QUEEN }
queen_x = board[queen_y].index QUEEN

result = count_controlled_square board, queen_y, queen_x, color.chr

# puts "answer"
puts result
