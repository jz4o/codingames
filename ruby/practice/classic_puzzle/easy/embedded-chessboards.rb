# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
input_rows = []
n.times do
  row, col, is_white = gets.split.collect(&:to_i)
  input_rows << [row, col, is_white]
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

results = input_rows.map do |row, col, is_white|
  row_pattern_size = row - 7
  col_pattern_size = col - 7

  pattern_size = row_pattern_size * col_pattern_size

  round_method = is_white.zero? ? :floor : :ceil

  (pattern_size / 2.0).method(round_method).call
end

# puts "answer"
results.each do |result|
  puts result
end
