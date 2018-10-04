# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@m = gets.to_i
@n = gets.to_i
map = []
map << Array.new(@n + 1, 1)
@m.times do
  row = gets.chomp
  map << [1, *row.chars.map(&:to_i)]
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer"

path_map = Array.new(@m + 1) { Array.new @n + 1, 0 }
map[1][1] = path_map[1][1] = 1
(1..@m).each do |row|
  (1..@n).each do |column|
    next unless map[row][column].zero?

    top_math_paths  = path_map[row.pred][column]
    left_math_paths = path_map[row][column.pred]
    path_map[row][column] = top_math_paths + left_math_paths
  end
end

puts path_map.last.last

