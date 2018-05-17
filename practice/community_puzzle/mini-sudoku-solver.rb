# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@line_1 = gets.chomp
@line_2 = gets.chomp
@line_3 = gets.chomp
@line_4 = gets.chomp

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

lines = [@line_1, @line_2, @line_3, @line_4]
square = lines.map { |line| line.chars.map(&:to_i) }

def optimize(square)
  square.each_with_index do |row, row_index|
    row.each_with_index do |column, column_index|
      next unless column.zero?

      candidate = [1,2,3,4]
      candidate -= row
      candidate -= square.map { |row| row[column_index] }

      little_square_rows = row_index < square.length / 2 ? [0, 1] : [2, 3]
      little_square_columns = column_index < row.length / 2 ? [0, 1] : [2, 3]
      little_square_indexes = little_square_rows.product little_square_columns
      candidate -= little_square_indexes.map { |ri, ci| square[ri][ci] }

      square[row_index][column_index] = candidate.pop if candidate.size == 1
    end
  end
end

sum = (1..square.length).sum * square.length
until square.flatten.sum == sum do
  optimize square
end

puts square.map(&:join)

