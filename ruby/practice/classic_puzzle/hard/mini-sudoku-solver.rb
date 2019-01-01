# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@line1 = gets.chomp
@line2 = gets.chomp
@line3 = gets.chomp
@line4 = gets.chomp

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

lines = [@line1, @line2, @line3, @line4]
square = lines.map { |line| line.chars.map(&:to_i) }

def optimize(square)
  square.each_with_index do |row, row_index|
    row.each_with_index do |column, column_index|
      next unless column.zero?

      candidate = [1, 2, 3, 4]
      candidate -= row
      candidate -= square.transpose[column_index]

      little_square_rows = row_index < square.length / 2 ? [0, 1] : [2, 3]
      little_square_columns = column_index < row.length / 2 ? [0, 1] : [2, 3]
      little_square_indexes = little_square_rows.product little_square_columns
      candidate -= little_square_indexes.map { |ri, ci| square[ri][ci] }

      square[row_index][column_index] = candidate.pop if candidate.size == 1
    end
  end
end

sum = (1..square.length).sum * square.length
optimize square until square.flatten.sum == sum

puts square.map(&:join)
