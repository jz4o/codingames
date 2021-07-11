# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
grid = []
n.times do
  line = gets.chomp

  grid << line.chars
end
width = grid.map(&:size).max + 2
grid.each do |row|
  row.concat Array.new(width - row.size, ' ')
end
grid << Array.new(width, ' ')
grid << Array.new(width, ' ')

n.next.downto(0) do |row_index|
  width.pred.downto(0) do |column_index|
    next unless grid[row_index][column_index] == ' '

    if row_index >= 2 && column_index >= 2 && grid[row_index - 2][column_index - 2] != ' '
      grid[row_index][column_index] = '`'
    end

    if row_index >= 1 && column_index >= 1 && grid[row_index - 1][column_index - 1] != ' '
      grid[row_index][column_index] = '-'
    end
  end
end

grid.each do |row|
  puts row.join.rstrip
end
