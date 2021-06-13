# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
l = gets.to_i

LIGHT_SPOT = 'O'.freeze
DARK_SPOT = 'X'.freeze

padding_row = Array.new(l * 2 + n, LIGHT_SPOT)
padding_column = Array.new(l, LIGHT_SPOT)

grid = []
l.times { grid << padding_row }
n.times do
  inputs = gets.split
  # for j in 0..(n-1)
  #     cell = inputs[j]
  # end

  grid << [*padding_column, *inputs, *padding_column]
end
l.times { grid << padding_row }

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

c_indexes = []
grid.each_with_index do |row, row_index|
  row.each_with_index do |column, column_index|
    c_indexes << [row_index, column_index] if column == 'C'
  end
end

replace_column = Array.new(l * 2 - 1, LIGHT_SPOT)
c_indexes.each do |row_index, column_index|
  ((row_index - l.pred)..(row_index + l.pred)).each do |c_row_index|
    grid[c_row_index][(column_index - l.pred)..(column_index + l.pred)] = replace_column
  end
end

# puts "2"
puts grid.flatten.count(DARK_SPOT)
