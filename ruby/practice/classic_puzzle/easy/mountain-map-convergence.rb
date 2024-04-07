# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i # the number of mountains
inputs = gets.split
heights = []
n.times do |i|
  height = inputs[i].to_i
  heights << height
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

def create_row(width, str_index, str)
  row = [' '] * width
  row[str_index] = str

  row
end

max_height = [*heights, 0].max
min_height = [*heights, 0].min

grid_height = max_height - min_height + 1

grid = []
[0, *heights, 0].each_cons(2) do |a, b|
  if a <= b
    grid.push create_row(grid_height, max_height - a, '\\')

    a.upto(b) do |h|
      grid.push create_row(grid_height, max_height - h, '/')
    end
  else
    a.downto(b) do |h|
      grid.push create_row(grid_height, max_height - h, '\\')
    end

    grid.push create_row(grid_height, max_height - b, '/')
  end
end

begin_width_index = heights.first.positive? ? 2 : 0
end_width_index = heights.last.positive? ? -3 : -1
effective_height = heights.min.positive? ? max_height : grid_height

effective_grid = grid[begin_width_index..end_width_index].map do |row|
  row[...effective_height]
end

results = effective_grid.transpose.map { |row| row.join.rstrip }

# puts "mountains"
results.each do |result|
  puts result
end
