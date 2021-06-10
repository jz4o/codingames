# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

grid = []
9.times do
  inputs = gets.split
  # for j in 0..(9-1)
  #     n = inputs[j].to_i
  # end
  grid << inputs
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

groups = []
groups += grid
groups += grid.transpose

sub_grids = Array.new(9) { [] }
9.times do |row_index|
  9.times do |column_index|
    sub_grid_index = (row_index / 3 * 3) + (column_index / 3)
    sub_grids[sub_grid_index] << grid[row_index][column_index]
  end
end
groups += sub_grids

result = groups.all? { |row| row.sort.join == (1..9).to_a.join }

# puts "true or false"
puts result
