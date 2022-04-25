# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

width, height = gets.split.collect(&:to_i)
grid = []
height.times do
  row = []

  inputs = gets.split
  width.times do |j|
    cell = inputs[j].to_i
    row << cell
  end

  grid << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

rectangle_sizes = []
grid.each_with_index do |row, row_index|
  row.each_with_index do |cell, cell_index|
    next unless cell == 1

    (1..height - row_index).each do |h|
      h_rows = grid[row_index, h]

      (1..width - cell_index).each do |w|
        binaries = h_rows.flat_map { |r| r[cell_index, w] }
        rectangle_sizes << binaries.size if binaries.all?(1)
      end
    end
  end
end

result = rectangle_sizes.max

# puts "answer"
puts result
