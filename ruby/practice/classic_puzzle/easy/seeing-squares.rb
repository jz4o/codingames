# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

r, _c = gets.split.map(&:to_i)
rows = []
r.times do
  row = gets.chomp
  rows << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

grid = rows.map(&:chars)

CORNER_CHAR = '+'.freeze
HORIZONTAL_CHAR = '-'.freeze
VERTICAL_CHAR = '|'.freeze

HORIZONTAL_CHARS = [HORIZONTAL_CHAR, CORNER_CHAR].freeze
VERTICAL_CHARS = [VERTICAL_CHAR, CORNER_CHAR].freeze

count = 0
grid[...-1].each_with_index do |row, row_index|
  row[...-1].each_with_index do |value, column_index|
    next if value != CORNER_CHAR

    below_corner_row_indexes = ((row_index + 1)...r).filter { |ri| grid[ri][column_index] == CORNER_CHAR }
    [row_index, *below_corner_row_indexes].each_cons(2) do |prev_below_row_index, below_row_index|
      prev_height = prev_below_row_index - row_index + 1
      prev_right_column_index = column_index + prev_height * 2 - 2

      height = below_row_index - row_index + 1
      right_column_index = column_index + height * 2 - 2

      top_horizontal_values = grid[row_index][prev_right_column_index...right_column_index] || []
      bottom_horizontal_values = grid[below_row_index][(column_index + 1)...right_column_index]
      left_vertical_values = (grid[prev_below_row_index...below_row_index] || []).map do |below_row|
        below_row[column_index]
      end
      right_vertical_values = grid[(row_index + 1)...below_row_index].map do |below_row|
        below_row[right_column_index]
      end
      right_corner_values = [
        grid[row_index][right_column_index],
        grid[below_row_index][right_column_index]
      ].flatten

      break unless top_horizontal_values.all? { |value| HORIZONTAL_CHARS.include? value }
      break unless left_vertical_values.all? { |value| VERTICAL_CHARS.include? value }

      next unless right_corner_values.all? CORNER_CHAR
      next unless bottom_horizontal_values.all? { |value| HORIZONTAL_CHARS.include? value }
      next unless right_vertical_values.all? { |value| VERTICAL_CHARS.include? value }

      count += 1
    end
  end
end

result = count

# puts "[][][]"
puts result
