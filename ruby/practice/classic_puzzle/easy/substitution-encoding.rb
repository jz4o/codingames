# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

rows = gets.to_i
grid = []
rows.times do
  row = gets.chomp

  grid << row.split
end
message = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

replace_table = {}
grid.each_with_index do |row, row_index|
  row.each_with_index do |char, column_index|
    replace_table[char] = "#{row_index}#{column_index}"
  end
end

result = message.chars.map { |char| replace_table[char] }.join

# puts "encode message"
puts result
