# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

BINGO_ROWS = 5

n = gets.to_i
rows = []
(n * BINGO_ROWS).times do
  row = gets.chomp

  rows << row
end
calls = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

player_numbers = []
lines = []

rows.each_slice(BINGO_ROWS) do |player_rows|
  grid = player_rows.map do |row|
    row.split.map(&:to_i)
  end

  player_numbers << grid.flatten

  lines += grid
  lines += grid.transpose

  lines << (0...BINGO_ROWS).to_a.map { |i| grid[i][i] }
  lines << (0...BINGO_ROWS).to_a.map { |i| grid[i][BINGO_ROWS - i - 1] }
end

player_numbers.each { |numbers| numbers.delete_if(&:zero?) }
lines.each { |line| line.delete_if(&:zero?) }

call_numbers = calls.split.map(&:to_i)

complete_index = nil
full_house_index = nil
call_numbers.each.with_index(1) do |number, index|
  lines.each { |line| line.delete number }
  complete_index = index if complete_index.nil? && lines.any?(&:empty?)

  player_numbers.each { |numbers| numbers.delete number }
  full_house_index = index and break if full_house_index.nil? && player_numbers.any?(&:empty?)
end

# puts "answer"
puts complete_index
puts full_house_index
