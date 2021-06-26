# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i # the number of mountains
inputs = gets.split
heights = []
(0...n).each do |i|
  # height: height of the mountain
  height = inputs[i].to_i

  heights << height
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

max_height = heights.max

transposed_map = []
heights.each do |height|
  height.times do |h|
    transposed_map << "#{' ' * (max_height - h - 1)}/#{' ' * h}".chars
  end
  height.times do |h|
    transposed_map << "#{' ' * (max_height - height + h)}\\#{' ' * (height - h - 1)}".chars
  end
end

map = transposed_map.transpose

# puts "answer"
map.each do |row|
  puts row.join.rstrip
end
