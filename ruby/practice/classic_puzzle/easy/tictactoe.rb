# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

grid = []
3.times do
  line = gets.chomp

  grid << line.chars
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

origin_grid = grid.dup

# check row
grid.map! do |row|
  row.sort.join == '.OO' ? 'OOO'.chars : row
end

# check column
if origin_grid == grid
  grid = grid.transpose
  grid.map! do |row|
    row.sort.join == '.OO' ? 'OOO'.chars : row
  end
  grid = grid.transpose
end

# check diagonal
if origin_grid == grid && (0..2).to_a.map { |index| grid[index][index] }.sort.join == '.OO'
  3.times { |index| grid[index][index] = 'O' }
end
if origin_grid == grid && (0..2).to_a.map { |index| grid[index][2 - index] }.sort.join == '.OO'
  3.times { |index| grid[index][2 - index] = 'O' }
end

# puts "answer"
puts origin_grid != grid && grid.map(&:join)
