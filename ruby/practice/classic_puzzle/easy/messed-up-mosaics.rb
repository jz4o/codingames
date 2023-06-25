# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
pattern = gets.chomp
rows = []
n.times do
  row = gets.chomp
  rows << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

pattern_size = pattern.size
n_size_pattern = pattern * n
double_size_pattern = pattern * 2

result = rows.filter_map.with_index do |row, row_index|
  unless n_size_pattern.include?(row)
    column_index = (n - 1).downto(0).find do |i|
      !double_size_pattern.include?(row[i, pattern_size])
    end

    "(#{column_index},#{row_index})"
  end
end

# puts "(x,y)"
puts result
