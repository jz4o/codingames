# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w = gets.to_i
h = gets.to_i
grid = []
grid << Array.new(w + 2, 0)
h.times do
  line = gets.chomp

  grid << [0, *line.tr('.x', '09').chars.map(&:to_i), 0]
end
grid << Array.new(w + 2, 0)

(1..h).each do |row_index|
  (1..w).each do |column_index|
    next unless grid[row_index][column_index] == 9

    grid[row_index - 1][column_index - 1] += 1 unless grid[row_index - 1][column_index - 1] == 9
    grid[row_index - 1][column_index + 0] += 1 unless grid[row_index - 1][column_index + 0] == 9
    grid[row_index - 1][column_index + 1] += 1 unless grid[row_index - 1][column_index + 1] == 9
    grid[row_index + 0][column_index - 1] += 1 unless grid[row_index + 0][column_index - 1] == 9
    grid[row_index + 0][column_index + 1] += 1 unless grid[row_index + 0][column_index + 1] == 9
    grid[row_index + 1][column_index - 1] += 1 unless grid[row_index + 1][column_index - 1] == 9
    grid[row_index + 1][column_index + 0] += 1 unless grid[row_index + 1][column_index + 0] == 9
    grid[row_index + 1][column_index + 1] += 1 unless grid[row_index + 1][column_index + 1] == 9
  end
end

results = grid[1..-2].map do |row|
  row[1..-2].join.tr('09', '..')
end

results.each do |result|
  puts result
end
