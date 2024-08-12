# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

thickness = gets.to_i
length = gets.to_i
turns = gets.to_i

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

grid_width = (thickness + 1) * (turns + 1) + 1

transposed_grid = Array.new(grid_width) { Array.new(length + 1, ' ') }
transposed_grid.first.fill('|', 1..)
transposed_grid.last.fill('|', 1..)
transposed_grid[1...-1].each do |row|
  row[0] = '_'
  row[-1] = '_'
end
turn_valley_part = ['|'] * (length - 1)
(1..turns).each do |t|
  i = (thickness + 1) * t
  transposed_grid[i] = t.odd? ? [' ', *turn_valley_part, '_'] : ['_', ' ', *turn_valley_part]
end

results = transposed_grid.transpose.map { |row| row.join.rstrip }

# puts "Print your amazing ASCII worm here!"
results.each do |result|
  puts result
end
