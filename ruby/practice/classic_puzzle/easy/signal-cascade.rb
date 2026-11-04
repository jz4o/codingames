# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

h, w = gets.split.map(&:to_i)
rows = []
h.times do
  row = gets.chomp
  rows << row
end
r, c = gets.split.map(&:to_i)

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

OVERLOAD = -1

grid = rows.map { |row| row.chars.map(&:to_i) }

# simulate cascade
grid[r][c] += 1
while grid.flatten.any? { |v| v > 9 }
  grid.each_with_index do |row, row_index|
    row.each_with_index do |value, column_index|
      next if value <= 9

      row_range = [row_index - 1, 0].max..[row_index + 1, h - 1].min
      column_range = [column_index - 1, 0].max..[column_index + 1, w - 1].min
      row_range.each do |ri|
        column_range.each do |ci|
          next if grid[ri][ci] == OVERLOAD

          grid[ri][ci] += 1
        end
      end
      grid[row_index][column_index] = OVERLOAD
    end
  end
end

# reset energy
grid.map! do |row|
  row.map do |value|
    [value, 0].max
  end
end

results = grid.map(&:join)

# puts "answer"
results.each do |result|
  puts result
end
