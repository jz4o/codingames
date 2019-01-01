# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i
@b = gets.chomp

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "0"

free_indexes = *0...@n
go_right_indexes = go_left_indexes = @b.chars.map.with_index { |b, i| i if b == '!' }.compact

while free_indexes.size > 1 do
  free_indexes -= (go_right_indexes + go_left_indexes)
  go_left_indexes = go_left_indexes.map(&:pred)
  go_right_indexes = go_right_indexes.map(&:next)
end

puts free_indexes.pop
