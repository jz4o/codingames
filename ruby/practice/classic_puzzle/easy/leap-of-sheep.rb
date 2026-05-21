# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
inputs = gets.split
heights = []
n.times do |i|
  height = inputs[i].to_i
  heights << height
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

difficults = heights[1...-1].map.with_index(1) do |value, index|
  left_value = heights[...index].min
  right_value = heights[(index + 1)..].min
  next nil if left_value >= value || right_value >= value

  value * 2 - left_value - right_value
end

result = difficults.compact.max

# puts "MAXIMAL DIFFICULTY"
puts result
